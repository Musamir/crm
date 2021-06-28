package auth

import "crm/internal/auth/models"

// UserRepository ...
type UserRepository interface {
	SingIn(request *models.User) (id int, status int)
	SignUp(request *models.User) (err error)
}

const (
	DbOk                 int = 0 // Success
	DbIncorrectLogOrPass int = 1 // Incorrect Login or Password
	DbFailedQuery        int = 2 // Query failed
)
