package main

import (
	"crm/internal/app"
	"fmt"
)

// @title CRM System by Musamir & Azino
// @version 1.0
// @description This is a simple crm system by two extraordinary guys: Musamir & Azino

// @host localhost:8085
// @BasePath /

// @securityDefinitions.apikey ApiKeyAuth
// @in header
// @name Authorization

func main() {
	fmt.Println("Starting the programm ...")

	confpath := "config/conf.json"

	err := app.Run(confpath)
	if err != nil {
		fmt.Println(err)
	}
}
