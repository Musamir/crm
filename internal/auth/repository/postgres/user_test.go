package postgres

import (
	"crm/internal/auth"
	"crm/internal/auth/models"
	"fmt"
	"testing"
)

func TestUserRepository(t *testing.T) {
	url := "postgres://postgres:sql@localhost:5432/commodity business"
	// url = "postgres://yohcfmeaqpopmw:9346f651a3e7223b874528ff8f5be59cb37d47b6a1318587b8d628ca669d27c5@ec2-54-91-188-254.compute-1.amazonaws.com:5432/d5hgt0nv8vkl5g"
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

	status = userRepo.ChangePassword(1, "b1b3773a05c0ed0176787a4f1574ff0075f7521e", "b1b3773a05c0ed0176787a4f1574ff0075f7521e")

	if status != auth.DbOk {
		t.Error("Expected status = 0, got ", status)
	}
}
