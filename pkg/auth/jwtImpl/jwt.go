package jwtImpl

import (
	"crm/pkg/auth"
	"errors"
	"fmt"
	"time"

	"github.com/dgrijalva/jwt-go"
)

// AuthClaims ...
type AuthClaims struct {
	jwt.StandardClaims
	ID int
}

// JWT ...
type JWT struct {
	signingKey     []byte
	expireDuration int64
}

// NewJWT ...
func NewJWT(signingKey string, expireDuration int64) (*JWT, error) {
	if signingKey == "" {
		return nil, errors.New("empty signingKey")
	}

	return &JWT{
		signingKey:     []byte(signingKey),
		expireDuration: expireDuration,
	}, nil
}

// NewToken ...
func (t *JWT) NewToken(Id int) (token *string, status int) {
	fmt.Println("(t *JWT) NewJWT(Id int) start ")
	defer fmt.Println("(t *JWT) NewJWT(Id int) end ")

	tokenStr, err := jwt.NewWithClaims(jwt.SigningMethodHS256, AuthClaims{
		ID: Id,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(time.Duration(time.Minute * time.Duration(t.expireDuration))).Unix(),
		},
	}).SignedString(t.signingKey)
	if err != nil {
		fmt.Println("error new jwt token =>", err)
		status = auth.FailedToCreateToken
		return
	}

	fmt.Println("(t *JWT) NewJWT(Id int) end token =>", tokenStr)
	token = &tokenStr
	status = auth.Ok
	return
}

// ParseToken ...
func (a *JWT) ParseToken(accessToken *string) (id int, status int) {
	token, err := jwt.ParseWithClaims(*accessToken, &AuthClaims{}, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
		}
		return a.signingKey, nil
	})

	if err != nil {
		fmt.Println("err parsing token =>", err)
		status = auth.ParsingError
	}

	if claims, ok := token.Claims.(*AuthClaims); ok && token.Valid {
		id = claims.ID
		status = auth.Ok
		return
	}
	fmt.Println("error parsing ErrInvalidAccessToken")
	status = auth.InvalidAccessToken
	return
}

// func (m *JWT) NewRefreshToken() (string, error) {
// 	b := make([]byte, 32)

// 	s := rand.NewSource(time.Now().Unix())
// 	r := rand.New(s)

// 	_, err := r.Read(b)
// 	if err != nil {
// 		return "", err
// 	}

// 	return fmt.Sprintf("%x", b), nil
// }
