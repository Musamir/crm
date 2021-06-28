package postgres

import (
	"context"
	"crm/internal/auth"
	"crm/internal/auth/models"
	"errors"
	"fmt"
	"strings"
)

var errUserExist = errors.New("user already exists")

const (
	noRows             string = "no rows in result set"
	somethingWentWrong string = "Something went wrong"
)

type user struct {
	ID       int
	Login    string
	Password string
}

func toPostgresUser(u *models.User) *user {
	return &user{
		ID:       u.ID,
		Login:    u.Login,
		Password: u.Password,
	}
}

func toModel(u *user) *models.User {
	return &models.User{
		ID:       u.ID,
		Login:    u.Login,
		Password: u.Password,
	}
}

// UserRepository ...
type UserRepository struct {
	db *Database
}

// NewUserRepository ...
func NewUserRepository(db *Database) *UserRepository {
	return &UserRepository{
		db: db,
	}
}

// SingIn returns id if login & password are correct otherwise returns incorrectLogOrPass and errorMessage
func (user *UserRepository) SingIn(request *models.User) (id int, status int) {
	fmt.Println("(user *UserRepository) SingIn start")
	defer fmt.Println("(user *UserRepository) SingIn end")
	pgUser := toPostgresUser(request)

	status = auth.DbOk
	err := user.db.conn.QueryRow(context.Background(), "SELECT ID FROM USERS WHERE LOGIN =$1 AND PASS=$2", pgUser.Login, strings.TrimSpace(pgUser.Password)).Scan(&id)
	if err != nil {
		status = auth.DbFailedQuery
		if err.Error() == noRows {
			status = auth.DbIncorrectLogOrPass
		}
		fmt.Printf("QueryRow failed: %v\n", err)
	}

	return
}

// SignUp ...
func (user *UserRepository) SignUp(request *models.User) (err error) {

	pgUser := toPostgresUser(request)
	var id uint64
	err = user.db.conn.QueryRow(context.Background(), "select id from users where login=$1", pgUser.Login).Scan(&id)
	if err != nil {
		if err == errNoRows {
			err = user.db.conn.QueryRow(context.Background(), "INSERT INTO USERS(login, pass) VALUES($1, $2) RETURNING id", request.Login, request.Password).Scan(&id)
			if err != nil {
				fmt.Printf("Unable to INSERT: %v\n", err)
				return err
			}
			return nil
		}
		fmt.Printf("QueryRow failed: %v\n", err)
	}
	return
}
