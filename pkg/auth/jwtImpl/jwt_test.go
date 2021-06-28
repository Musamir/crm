package jwtImpl

import (
	"crm/pkg/auth"
	"fmt"
	"testing"
)

func TestJWT(t *testing.T) {
	signingKey := "test"
	var expireDuration int64 = 5

	JWT, err := NewJWT(signingKey, expireDuration)

	if err != nil {
		fmt.Print(err.Error())
	} else {
		fmt.Println("created")
	}

	token, status := JWT.NewToken(5)

	if status == auth.FailedToCreateToken {
		t.Error("Error ", "couldn't create a token")
	}

	id, status := JWT.ParseToken(token)

	if status == auth.ParsingError {
		t.Error("Error ", err.Error())
	} else if status == auth.InvalidAccessToken {
		t.Error("Error ", "invalid token")
	}
	if id != 5 {
		t.Error("expected id = 5, got", id)
	}
}
