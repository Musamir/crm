package business

import "crm/internal/business/models"

// UserUseCase ...
type UserUseCase interface {
	SetUserInfo(userInfo *models.UsersInfo) error
	GetUserInfo(id int) (*models.UsersInfo, error)
	GetUserPhoto(id int) (*string, error)
}
