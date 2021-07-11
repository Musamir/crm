package postgres

import (
	"context"
	"fmt"
)

func ExampleDatabase() {
	url := "postgres://postgres:sql@localhost:5432/commodity business"
	url = "postgres://yohcfmeaqpopmw:9346f651a3e7223b874528ff8f5be59cb37d47b6a1318587b8d628ca669d27c5@ec2-54-91-188-254.compute-1.amazonaws.com:5432/d5hgt0nv8vkl5g"
	db := NewDatabase(url)
	defer db.Close()
	ctx := context.Background()
	db.conn.Ping(ctx)
	//if it is not connected, the program shuts down

	fmt.Println("connected")

	if db.Close() != nil {
		fmt.Println("failed to close")
	} else {
		fmt.Println("closed")
	}

	// Output:
	// connected
	// closed
}
