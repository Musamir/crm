package http

import (
	"crm/internal/business"
	"crm/internal/business/models"
	"fmt"
	"net/http"
	"os"
	"strconv"
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
	ID          int    `json:"id"`
	Login       string `json:"login"`
	FullName    string `json:"fullName"`
	Sex         string `json:"sex"`
	DateOfBirth string `json:"dateOfBirth"`
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
	}

}

// SetUserInfo sets user information
func (userHandler *UserHandler) SetUserInfo(c *gin.Context) {
	input := new(userInfo)

	id, err := strconv.Atoi(c.PostForm("id"))
	if err != nil {
		c.AbortWithStatus(http.StatusBadRequest)
		return
	}

	input.ID = id
	input.Login = c.PostForm("login")
	input.FullName = c.PostForm("fullname")
	input.Sex = c.PostForm("sex")
	input.DateOfBirth = c.PostForm("dateofbirth")
	// single file
	file, _ := c.FormFile("file")
	fmt.Println("file.Filename = ", file.Filename)

	expansion := strings.Split(file.Filename, ".")[1]
	file.Filename = fmt.Sprint(input.ID) + "." + expansion

	dst := "files/users_photo/"

	// Upload the file to specific dst.
	fmt.Println("c.SaveUploadedFile(file, dst) ==> ", c.SaveUploadedFile(file, dst+file.Filename))
	fmt.Println("input =", input)

	err = userHandler.Impl.SetUserInfo(toModelsUser(input, file.Filename))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		c.Abort()
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"status": "the user information was set",
	})
	c.Status(http.StatusOK)
}

// GetUserInfo gets user information
func (userHandler *UserHandler) GetUserInfo(c *gin.Context) {

	id, _ := c.Get("user")

	userInfo, err := userHandler.Impl.GetUserInfo(id.(int))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		c.Abort()
		return
	}
	c.JSON(http.StatusOK, userInfo)
	c.Status(http.StatusOK)
}

// GetUserInfo gets user information
func (userHandler *UserHandler) GetUserProfilePhoto(c *gin.Context) {

	id, _ := c.Get("user")

	filename, err := userHandler.Impl.GetUserPhoto(id.(int))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "empty profile",
		})
		// c.Status(http.StatusBadRequest)
		fmt.Println("error == :", err)
		return
	}

	if *filename == "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "empty profile",
		})
		// c.Status(http.StatusBadRequest)
		fmt.Println("error == : empty profile")
		return
	}
	path := "files/users_photo/" + *filename
	if _, err = os.Stat(path); os.IsNotExist(err) {
		// path/to/whatever does not exist
		fmt.Println("profile photo does not exist")
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "empty profile",
		})
		return
	}
	c.File(path)
	c.Status(http.StatusOK)
}

func toSetUserInfo(u *models.UsersInfo) *userInfo {
	return &userInfo{}
}

func toModelsUser(u *userInfo, profilePhoto string) *models.UsersInfo {
	return &models.UsersInfo{
		ID:           u.ID,
		Login:        u.Login,
		FullName:     u.FullName,
		Sex:          u.Sex,
		DateOfBirth:  u.DateOfBirth,
		ProfilePhoto: profilePhoto,
	}
}
