package http

import (
	"crm/internal/auth"
	"errors"
	"fmt"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

func corsMiddleware(c *gin.Context) {
	c.Header("Access-Control-Allow-Origin", "*")
	c.Header("Access-Control-Allow-Methods", "*")
	c.Header("Access-Control-Allow-Headers", "*")
	c.Header("Content-Type", "application/json")

	if c.Request.Method != "OPTIONS" {
		c.Next()
	} else {
		c.AbortWithStatus(http.StatusOK)
	}
}

// AuthMiddleware ...
type AuthMiddleware struct {
	usecase auth.AuthUseCase
}

// NewAuthTokenCheckMiddleware ...
func NewAuthTokenCheckMiddleware(usecase auth.AuthUseCase) gin.HandlerFunc {
	return (&AuthMiddleware{
		usecase: usecase,
	}).CheckToken
}

var ErrInvalidAccessToken = errors.New("invalid access token")

// CheckToken ...
func (m *AuthMiddleware) CheckToken(c *gin.Context) {
	authHeader := c.GetHeader("Authorization")
	if authHeader == "" {
		c.AbortWithStatus(http.StatusUnauthorized)
		return
	}

	headerParts := strings.Split(authHeader, " ")
	if len(headerParts) != 2 {
		c.AbortWithStatus(http.StatusUnauthorized)
		return
	}

	if headerParts[0] != "Bearer" {
		c.AbortWithStatus(http.StatusUnauthorized)
		return
	}
	fmt.Println("header =>", headerParts)
	id, err := m.usecase.ParseToken(&headerParts[1])
	if err != nil {
		fmt.Println("id ===", id)

		status := http.StatusUnauthorized

		c.AbortWithStatus(status)
		return
	}
	fmt.Println("middleware id = ", id)
	c.Set("user", id)
	st, a := c.Get("user")
	fmt.Println("middleware getstring = ", st, a)
}
