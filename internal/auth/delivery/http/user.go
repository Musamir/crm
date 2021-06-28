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
	Login    string `json:"login"`
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

var errr string = "errr"

// @Summary signIn
// @Tags auth
// @Description signIn checks the users login and password and returns token if the user exists
// @Accept  json
// @Produce  json
// @Param input body signRequest true "account info"
// @Success 200 {object} signInResponse
// @Failure 400 {string} errr
// @Failure 500 {string} internalServerError
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

		c.JSON(http.StatusOK, gin.H{
			"id":    id,
			"token": *token,
		})
	}
}

type signInResponse struct {
	Token string `json:"token"`
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
