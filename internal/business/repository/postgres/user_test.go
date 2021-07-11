package postgres

import (
	"testing"
)

func TestUserRepository(t *testing.T) {
	url := "postgres://postgres:sql@localhost:5432/commodity business"

	db := NewDatabase(url)
	defer db.Close()

	userRepo := NewUserRepository(db)

	sexList, err := userRepo.GetSexList()
	if err != nil {
		t.Error("error:", err)
	}

	want := []string{"Female", "Male"}
	if len(want) != len(*sexList) {
		t.Error("error:", "len doesn't match")
	}

	for i, sex := range *sexList {
		if sex != want[i] {
			t.Error("error:", "sex value doesn't match. Want: ", want[i], " got:", sex)
		}
	}

}
