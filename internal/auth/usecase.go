package auth

import "accounting/internal/auth/models"

// AuthUseCase ...
type AuthUseCase interface {
	SignIn(user *models.User) (token *string, err error)
	SignUp(user *models.User) (err error)
	ParseToken(token *string) (int, error)
}
