package usecase

import (
	"crm/internal/business"
	"crm/internal/business/models"
	"fmt"
)

// UserUseCase ...
type UserUseCase struct {
	userRepo business.UserRepository
}

// NewBusinessUseCase ...
func NewUserUseCase(userRepo business.UserRepository) *UserUseCase {
	return &UserUseCase{
		userRepo: userRepo,
	}
}

// SetUserInfo sets user information
func (a *UserUseCase) SetUserInfo(user *models.UsersInfo) error {
	fmt.Println("(a *BusinessUseCase) SetUserInfo start")
	defer fmt.Println("(a *BusinessUseCase) SetUserInfo end")

	return a.userRepo.SetUserInfo(user)
}

// GetUserInfo gets user information by the specified id
func (a *UserUseCase) GetUserInfo(id int) (*models.UsersInfo, error) {
	fmt.Println("(a *UserUseCase) GetUserInfo start")
	defer fmt.Println("(a *UserUseCase) GetUserInfo end")

	return a.userRepo.GetUserInfo(id)
}

// GetUserPhoto gets user profile photo by the specified id
func (a *UserUseCase) GetUserPhoto(id int) (*string, error) {
	fmt.Println("(a *UserUseCase) GetUserPhoto start")
	defer fmt.Println("(a *UserUseCase) GetUserPhoto end")

	return a.userRepo.GetUserPhoto(id)
}

//GetSexList gets sex list
func (a *UserUseCase) GetSexList() (*[]string, error) {
	fmt.Println("(a *UserUseCase) GetSexList()  start")
	defer fmt.Println("(a *UserUseCase) GetSexList()  end")
	return a.userRepo.GetSexList()
}
