package auth

// TokenUseCase ...
type TokenUseCase interface {
	NewToken(userId int) (token *string, status int)
	ParseToken(accessToken *string) (id int, status int)
	//NewRefreshToken() (string, error)
}

//Statuses ...
const (
	//Ok ...
	Ok int = 0 // "success"
	// InvalidAccessToken ...
	InvalidAccessToken int = 1 //"invalid access token"
	// ErrUserNotFound ...
	ParsingError int = 2 // couldn't parce the token
	//FailedToCreateToken ...
	FailedToCreateToken = 3 // couldn't create a token
)
