package http

import (
	"crm/internal/business"
	"crm/internal/business/models"
	"fmt"
	"net/http"
	"os"
	"strings"

	"github.com/gin-gonic/gin"
)

// Handler-used for data interaction over the http protocol
type UserHandler struct {
	// userImp - user repository implementation
	Impl business.UserUseCase
}

// NewHandler creates a new Handler structure
func NewUserHandler(Impl business.UserUseCase) *UserHandler {

	return &UserHandler{
		Impl: Impl,
	}
}

// signRequest - structure that is sent to sign-in/up url
type userInfo struct {
	Login              string `json:"login"`              // login - user login
	FullName           string `json:"fullName"`           // fullName - user fullName
	Sex                string `json:"sex"`                // sex - user sex
	DateOfBirth        string `json:"dateOfBirth"`        // dateOfBirth - user date of birth
	ChangeProfilePhoto string `json:"changeProfilePhoto"` // changeProfilePhoto = {"yes" - change, "no" - pass}
	ProfilePhoto       string `json:"profilephoto"`       // profilephoto - user profile photo file. If you don't want to change profile photo send current profilephoto filename
}

// RegisterUser registers userinfo handlers
func (UserHandler *UserHandler) RegisterUser(groupname string, router *gin.RouterGroup) {

	userEndpoints := router.Group(groupname)
	{
		userEndpoints.PUT("/setUserInfo", UserHandler.SetUserInfo)
		userEndpoints.GET("/getUserInfo", UserHandler.GetUserInfo)
		userEndpoints.GET("/getUserProfilePhoto", UserHandler.GetUserProfilePhoto)
		// userEndpoints.StaticFile("/male.jpg", "files/user_photo/00.jpg")
		userEndpoints.GET("/male.jpg", func(c *gin.Context) {
			c.File("files/users_photo/00.jpg")
		})
		userEndpoints.GET("/female.jpg", func(c *gin.Context) {
			c.File("files/users_photo/01.jpg")
		})
		// userEndpoints.StaticFile("/01.jpg", "files/user_photo/01.jpg")
		userEndpoints.GET("/test", test)
	}

}

const (
	internalServerError string = "Oops something went wrong"
	userInfoWasSet      string = "The user information was set"
)

// @Summary SetUserInfo
// @Security ApiKeyAuth
// @Tags safe
// @Description SetUserInfo sets user information
// @Accept  mpfd
// @Produce  json
// @Param input body userInfo true "account info"
// @Success 200 {string} message "the user information was set"
// @Failure 400 {string} error "Bad Request"
// @Failure 401 {string} error "Unauthorized!!"
// @Failure 500 {string} error "Oops something went wrong"
// @Router /safe/business/setUserInfo [put]
// SetUserInfo sets user information
func (userHandler *UserHandler) SetUserInfo(c *gin.Context) {
	id, exist := geId(c)
	if !exist {
		c.JSON(http.StatusBadRequest, "the id doesn't exist")
		c.Abort()
		return

	}

	fmt.Println("id ==", id)

	input := new(userInfo)

	input.Login = c.PostForm("login")
	input.FullName = c.PostForm("fullName")
	input.Sex = c.PostForm("sex")
	input.DateOfBirth = c.PostForm("dateOfBirth")
	input.ChangeProfilePhoto = c.PostForm("changeProfilePhoto")

	if input.ChangeProfilePhoto == "yes" {
		file, err := c.FormFile("profilephoto") // single file
		if err != nil {
			c.JSON(http.StatusBadRequest, err.Error())
			c.Abort()
			return
		}

		fmt.Println("file.Filename = ", file.Filename)

		expansion := strings.Split(file.Filename, ".")[1]

		file.Filename = fmt.Sprint(id) + "." + expansion

		dst := "files/users_photo/"

		input.ProfilePhoto = file.Filename
		// Upload the file to specific dst.
		fmt.Println("c.SaveUploadedFile(file, dst) ==> ", c.SaveUploadedFile(file, dst+file.Filename))
	} else {
		input.ProfilePhoto = c.PostForm("profilephoto")
	}

	fmt.Println("input ==>", input, "id =", id)

	err := userHandler.Impl.SetUserInfo(toModelsUser(input, id))
	if err != nil {
		c.JSON(http.StatusBadRequest, err.Error())
		c.Abort()
		return
	}

	c.JSON(http.StatusOK, userInfoWasSet)
}

// @Summary GetUserInfo
// @Security ApiKeyAuth
// @Tags safe
// @Description GetUserInfo gets user information
// @Produce  json
// @Success 200 {string} message "the user information was set"
// @Failure 400 {string} error "Bad Request"
// @Failure 401 {string} error "Unauthorized!!"
// @Failure 500 {string} error "Oops something went wrong"
// @Router /safe/business/getUserInfo [get]
// GetUserInfo gets user information
func (userHandler *UserHandler) GetUserInfo(c *gin.Context) {

	id, exist := geId(c)
	if !exist {
		c.JSON(http.StatusBadRequest, "the id doesn't exist")
		c.Abort()
		return
	}

	userInfo, err := userHandler.Impl.GetUserInfo(id)
	if err != nil {
		c.JSON(http.StatusBadRequest, err.Error())
		c.Abort()
		return
	}
	c.JSON(http.StatusOK, userInfo)
}

// @Summary GetUserProfilePhoto
// @Security ApiKeyAuth
// @Tags safe
// @Description GetUserProfilePhoto gets user profile photo
// @Produce  mpfd
// @Success 200 {string} message "file"
// @Failure 400 {string} error "Bad Request"
// @Failure 401 {string} error "Unauthorized!!"
// @Failure 500 {string} error "Oops something went wrong"
// @Router /safe/business/getUserProfilePhoto [get]
// GetUserProfilePhoto gets user profile photo
func (userHandler *UserHandler) GetUserProfilePhoto(c *gin.Context) {

	id, exist := geId(c)
	if !exist {
		c.JSON(http.StatusBadRequest, "the id doesn't exist")
		c.Abort()
		return
	}

	filename, err := userHandler.Impl.GetUserPhoto(id)
	if err != nil {
		c.JSON(http.StatusBadRequest, "empty profile")
		// c.Status(http.StatusBadRequest)
		fmt.Println("error == :", err)
		c.Abort()
		return
	}

	if *filename == "" {
		c.JSON(http.StatusBadRequest, "empty profile")
		// c.Status(http.StatusBadRequest)
		fmt.Println("error == : empty profile")
		c.Abort()
		return
	}
	path := "files/users_photo/" + *filename
	if _, err = os.Stat(path); os.IsNotExist(err) {
		// path/to/whatever does not exist
		fmt.Println("profile photo does not exist")
		c.JSON(http.StatusBadRequest, "empty profile")
		c.Abort()
		return
	}
	c.File(path)
	c.Status(http.StatusOK)
}

func toSetUserInfo(u *models.UsersInfo) *userInfo {
	return &userInfo{}
}

func toModelsUser(u *userInfo, id int) *models.UsersInfo {
	return &models.UsersInfo{
		ID:           id,
		Login:        u.Login,
		FullName:     u.FullName,
		Sex:          u.Sex,
		DateOfBirth:  u.DateOfBirth,
		ProfilePhoto: u.ProfilePhoto,
	}
}

// @Summary test
// @Security ApiKeyAuth
// @Tags safe
// @Description test is used to test your jwt token. It return "hello" if your token is suitable
// @Produce  json
// @Success 200 {string} message "hello"
// @Failure 400 {string} error "error"
// @Failure 401 {string} error "Unauthorized!!"
// @Failure 500 {string} error "something went wrong"
// @Router /safe/business/test [get]
func test(c *gin.Context) {
	c.JSON(200, "hello")
}

func geId(c *gin.Context) (id int, exist bool) {
	idstr, exist := c.Get("user")
	id = idstr.(int)
	return
}
