package business

import "crm/internal/business/models"

// UserRepository ...
type UserRepository interface {
	SetUserInfo(request *models.UsersInfo) error
	GetUserInfo(id int) (*models.UsersInfo, error)
	GetUserPhoto(id int) (*string, error)
}
