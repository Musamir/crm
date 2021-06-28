package usecase

import (
	"crm/internal/auth"
	"crm/internal/auth/models"
	"crypto/sha1"
	"fmt"

	authToken "crm/pkg/auth"
)

// AuthUseCase ...
type AuthUseCase struct {
	userRepo auth.UserRepository
	jwtImpl  authToken.TokenUseCase
}

// NewAuthUseCase ...
func NewAuthUseCase(userRepo auth.UserRepository, jwt authToken.TokenUseCase) *AuthUseCase {
	return &AuthUseCase{
		userRepo: userRepo,
		jwtImpl:  jwt,
	}
}

// ParseToken ...
func (a *AuthUseCase) ParseToken(token *string) (int, int) {
	return a.jwtImpl.ParseToken(token)
}

// SignIn ...
func (a *AuthUseCase) SignIn(user *models.User) (id int, token *string, status int) {
	fmt.Println("(a *AuthUseCase) SignIn start")
	defer fmt.Println("(a *AuthUseCase) SignIn end")
	user.Password = *hash(&user.Password)
	fmt.Println("user.Password = ", user.Password)
	id, status = a.userRepo.SingIn(user)

	if status != auth.DbOk {
		status = auth.IncorrectLogOrPass
		return
	}

	token, status = a.jwtImpl.NewToken(id)
	if status != authToken.Ok {
		status = auth.ServerError
	}
	return
}

// SignUp ...
func (a *AuthUseCase) SignUp(user *models.User) error {

	user.Password = *hash(&user.Password)

	return a.userRepo.SignUp(user)
}

func hash(pass *string) *string {

	h := sha1.New()

	h.Write([]byte(*pass))

	hash := fmt.Sprintf("%x\n", h.Sum(nil))

	return &hash
}
