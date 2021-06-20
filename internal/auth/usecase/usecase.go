package usecase

import (
	"crm/internal/auth"
	"crm/internal/auth/models"
	"crypto/sha1"
	"fmt"

	token "crm/pkg/auth"
)

// AuthUseCase ...
type AuthUseCase struct {
	userRepo auth.UserRepository
	jwtImpl  token.TokenUseCase
}

// NewAuthUseCase ...
func NewAuthUseCase(userRepo auth.UserRepository, jwt token.TokenUseCase) *AuthUseCase {
	return &AuthUseCase{
		userRepo: userRepo,
		jwtImpl:  jwt,
	}
}

// ParseToken ...
func (a *AuthUseCase) ParseToken(token *string) (int, error) {
	return a.jwtImpl.ParseToken(token)
}

// SignIn ...
func (a *AuthUseCase) SignIn(user *models.User) (int, *string, error) {
	fmt.Println("(a *AuthUseCase) SignIn start")
	user.Password = *hash(&user.Password)
	fmt.Println("user.Password = ", user.Password)
	id, err := a.userRepo.SingIn(user)
	if err != nil {
		return 0, nil, err
	}
	fmt.Println("(a *AuthUseCase) SignIn end")
	token, err := a.jwtImpl.NewJWT(id)
	return id, token, err
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
