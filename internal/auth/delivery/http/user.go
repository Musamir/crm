package http

import (
	"crm/internal/auth"
	"crm/internal/auth/models"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

const (
	internalServerError string = "Oops something went wrong"
	incorrectLogOrPass  string = "Incorrect login or password"
	incorrectPass       string = "incorrectPassword"
	success             string = "success"
)

// Handler-used for data interaction over the http protocol
type UserHandler struct {
	// userImp - user repository implementation
	Impl auth.AuthUseCase
}

// NewHandler creates a new Handler structure
func NewUserHandler(Impl auth.AuthUseCase) *UserHandler {

	return &UserHandler{
		Impl: Impl,
	}
}

// signRequest - structure that is sent to sign-in/up url
type signRequest struct {
	// login - user login (required, not null)
	Login string `json:"login"`
	// password - user password (required, not null)
	Password string `json:"password"`
}

// RegisterUser registers sign-in, sign-up handlers and returns safeGroup routerGroup which checks token (ie use TokenCheckMiddleware)
func (UserHandler *UserHandler) RegisterUser(groupname string, router *gin.Engine) *gin.RouterGroup {
	// user Implementation

	authEndpoints := router.Group(groupname)
	{
		authEndpoints.POST("/sign-in", UserHandler.signIn)
		authEndpoints.POST("/sign-up", UserHandler.signUp)
	}

	safeGroup := router.Group("safe")
	{
		safeGroup.Use(NewAuthTokenCheckMiddleware(UserHandler.Impl))
		safeGroup.PUT("/"+groupname+"/changePassword", UserHandler.ChangePassword)
	}
	return safeGroup
}

// signUp creates an account for the user
func (userHandler *UserHandler) signUp(c *gin.Context) {
	input := new(signRequest)
	if err := c.BindJSON(input); err != nil {
		c.AbortWithStatus(http.StatusBadRequest)
		return
	}
	err := userHandler.Impl.SignUp(toModelsUser(input))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		c.Abort()
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"status": "the user was registered",
	})
	c.Status(http.StatusOK)
}

// @Summary signIn
// @Tags auth
// @Description signIn checks the users login and password and returns token if the user exists
// @Accept  json
// @Produce  json
// @Param input body signRequest true "account info"
// @Success 200 {object} signInResponse
// @Failure 400 {string} error "Incorrect login or password"
// @Failure 401 {string} error "Unauthorized!!"
// @Failure 500 {string} error "Oops something went wrong(( Sorry, please try again later"
// @Router /auth/sign-in [post]
// signIn checks the users login and password and returns token if the user exists
func (userHandler *UserHandler) signIn(c *gin.Context) {
	input := new(signRequest)
	if err := c.BindJSON(input); err != nil {
		c.AbortWithStatus(http.StatusBadRequest)
		return
	}

	fmt.Println("user=>", input)

	id, token, status := userHandler.Impl.SignIn(toModelsUser(input))
	if status == auth.IncorrectLogOrPass {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": incorrectLogOrPass,
		})
	} else if status == auth.ServerError {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": internalServerError,
		})
	} else {

		c.JSON(http.StatusOK, signInResponse{
			Id:    id,
			Token: *token,
		})
	}
}

// changePasswordRequest stuct for password change
type changePasswordRequest struct {
	OldPassword string `json:"oldpassword"`
	NewPassword string `json:"newpassword"`
}

// @Summary ChangePassword
// @Security ApiKeyAuth
// @Tags safe
// @Description ChangePassword changed user password
// @Param input body changePasswordRequest true "change pass struct"
// @Accept  json
// @Produce  json
// @Success 200 {string} status "success"
// @Failure 400 {string} error "incorrectPassword or the id doesn't exist"
// @Failure 401 {string} error "Unauthorized!!"
// @Failure 500 {string} error "Oops something went wrong"
// @Router /safe/auth/changePassword [put]
// ChangePassword changed user password
func (userHandler *UserHandler) ChangePassword(c *gin.Context) {
	id, exist := geId(c)
	if !exist {
		c.JSON(http.StatusBadRequest, "the id doesn't exist")
		c.Abort()
		return
	}
	fmt.Println("id ==", id)
	input := new(changePasswordRequest)

	if err := c.BindJSON(input); err != nil {
		c.AbortWithStatus(http.StatusBadRequest)
		return
	}

	fmt.Println("input ==>", input)

	if input.NewPassword == "" {
		c.JSON(http.StatusBadRequest, incorrectPass)
		c.Abort()
		return
	}

	status := userHandler.Impl.ChangePassword(id, input.OldPassword, input.NewPassword)
	fmt.Println("result status ==>", status)
	if status == auth.IncorrectPassword {
		c.JSON(http.StatusBadRequest, incorrectPass)
	} else if status != auth.Ok {
		c.JSON(http.StatusInternalServerError, internalServerError)
	} else {
		c.JSON(http.StatusOK, success)
	}
}

type signInResponse struct {
	Id    int    `json:"id"`    // Id - user id
	Token string `json:"token"` // token - generated new token for the user
}

func toSignInput(u *models.User) *signRequest {
	return &signRequest{
		Login:    u.Login,
		Password: u.Password,
	}
}

func toModelsUser(u *signRequest) *models.User {
	return &models.User{
		Login:    u.Login,
		Password: u.Password,
	}
}

func geId(c *gin.Context) (id int, exist bool) {
	idstr, exist := c.Get("user_id")
	id = 0
	if exist {
		id = idstr.(int)
	}
	return
}
