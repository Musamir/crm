package postgres

import (
	"crm/internal/auth"
	"crm/internal/auth/models"
	"fmt"
	"testing"
)

func TestUserRepository(t *testing.T) {
	url := "postgres://postgres:sql@localhost:5432/commodity business"
	db := NewDatabase(url)
	defer db.Close()

	userRepo := NewUserRepository(db)

	user := &models.User{
		Login:    "TEST",
		Password: "b1b3773a05c0ed0176787a4f1574ff0075f7521e",
	}

	id, status := userRepo.SingIn(user)
	if status != auth.DbOk {
		fmt.Println("no id")
		fmt.Println("the login or password is incorrect")
		t.Error("Expected status = 0, got ", status)
	}
	if id != 1 {
		t.Error("Expected id = 1, got ", id)
	}

}
