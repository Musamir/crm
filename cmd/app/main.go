package main

import (
	"accounting/internal/app"
	"fmt"
)

func main() {
	fmt.Println("Starting the programm ...")

	confpath := "config/conf.json"

	err := app.Run(confpath)
	if err != nil {
		fmt.Println(err)
	}
}
