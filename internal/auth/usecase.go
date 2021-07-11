package auth

import "crm/internal/auth/models"

// AuthUseCase ...
type AuthUseCase interface {
	SignIn(user *models.User) (id int, token *string, status int)
	SignUp(user *models.User) (err error)
	ParseToken(token *string) (id int, status int)
	ChangePassword(id int, oldPassword string, newPassword string) (status int)
}

const (
	//Ok ...
	Ok int = 0 // Success
	//IncorrectLogOrPass
	IncorrectLogOrPass int = 1 // Incorrect Login or Password
	// InvalidAccessToken ...
	InvalidAccessToken int = 2 //"invalid access token"
	// ErrUserNotFound ...
	ParsingError int = 3 // couldn't parce the token
	//FailedToCreateToken ...
	FailedToCreateToken = 4 // couldn't create a token
	//ServerError
	ServerError = 5 // Something went wrong
	//IncorrectPassword
	IncorrectPassword = 6
)
