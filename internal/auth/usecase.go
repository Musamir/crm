package auth

import "crm/internal/auth/models"

// AuthUseCase ...
type AuthUseCase interface {
	SignIn(user *models.User) (id int, token *string, err error)
	SignUp(user *models.User) (err error)
	ParseToken(token *string) (int, error)
}
