package postgres

import (
	"context"
	"crm/internal/business/models"
	"fmt"
)

type user struct {
	ID       int
	Login    string
	Password string
}

// func toPostgresUser(u *models.User) *user {
// 	return &user{
// 		ID:       u.ID,
// 		Login:    u.Login,
// 		Password: u.Password,
// 	}
// }

// func toModel(u *user) *models.User {
// 	return &models.User{
// 		ID:       u.ID,
// 		Login:    u.Login,
// 		Password: u.Password,
// 	}
// }

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

// SetUserInfo sets user information
func (user *UserRepository) SetUserInfo(request *models.UsersInfo) error {
	fmt.Println("(user *UserRepository) SetUserInfo start")
	defer fmt.Println("(user *UserRepository) SetUserInfo end")

	_, err := user.db.conn.Exec(context.Background(), "UPDATE USERS_INFO SET FULLNAME = $1, SEX = (SELECT SEX.ID FROM SEX WHERE SEX.NAME = $2), DATE_OF_BIRTH = $3, PROFILE_PHOTO = $4 WHERE ID = $5",
		request.FullName, request.Sex, request.DateOfBirth, request.ProfilePhoto, request.ID)

	if err != nil {
		fmt.Printf("Exec failed1: %v\n", err)
	}

	_, err = user.db.conn.Exec(context.Background(), "UPDATE USERS SET LOGIN = $1 WHERE ID = $2", request.Login, request.ID)

	if err != nil {
		fmt.Printf("Exec failed2: %v\n", err)
	}

	return err
}

//GetUserInfo get user information
func (user *UserRepository) GetUserInfo(id int) (*models.UsersInfo, error) {
	fmt.Println(" (user *UserRepository) GetUserInfo start")
	defer fmt.Println(" (user *UserRepository) GetUserInfo end")

	var userInfo models.UsersInfo

	var login, fullname, sex, dateofbirth, profilephoto string

	err := user.db.conn.QueryRow(
		context.Background(),
		"SELECT USERS_INFO.ID, USERS.LOGIN, FULLNAME, SEX.NAME, to_char(DATE_OF_BIRTH, 'YYYY.DD.MM'), COALESCE(PROFILE_PHOTO, '') FROM USERS_INFO, USERS, SEX WHERE USERS.ID = $1 AND USERS_INFO.ID = USERS.ID AND SEX.ID = SEX  ORDER BY FULLNAME",
		id).Scan(&id, &login, &fullname, &sex, &dateofbirth, &profilephoto)
	if err != nil {
		fmt.Printf("Unable to SELECT: %v\n", err)
		return nil, err
	}

	userInfo.ID = id
	userInfo.Login = login
	userInfo.Sex = sex
	userInfo.DateOfBirth = dateofbirth
	userInfo.ProfilePhoto = profilephoto

	fmt.Println("userInfo ===>", userInfo)

	return &userInfo, nil
}

//GetUserPhoto get user profile photo
func (user *UserRepository) GetUserPhoto(id int) (*string, error) {
	fmt.Println(" (user *UserRepository) GetUserPhoto start")
	defer fmt.Println(" (user *UserRepository) GetUserPhoto end")
	var profilephoto string
	err := user.db.conn.QueryRow(
		context.Background(),
		"SELECT COALESCE(PROFILE_PHOTO, '') FROM USERS_INFO, USERS WHERE USERS.ID = $1 AND USERS_INFO.ID = USERS.ID",
		id).Scan(&profilephoto)
	if err != nil {
		fmt.Printf("Unable to SELECT: %v\n", err)
		return nil, err
	}

	fmt.Println("profilephoto ===>", profilephoto)

	return &profilephoto, nil
}
