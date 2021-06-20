package models

// User is our user structure
type User struct {
	ID       int
	Login    string
	Password string
}

// UsersInfo contains users information
type UsersInfo struct {
	ID           int
	Login        string
	FullName     string
	Sex          string
	DateOfBirth  string
	ProfilePhoto string
}
