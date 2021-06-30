package postgres

import (
	"context"
	"fmt"
)

func ExampleDatabase() {
	url := "postgres://postgres:sql@localhost:5432/commodity business"
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
