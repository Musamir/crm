package app

import (
	"context"
	authHttp "crm/internal/auth/delivery/http"
	authPostgres "crm/internal/auth/repository/postgres"
	authUseCase "crm/internal/auth/usecase"
	businessHttp "crm/internal/business/delivery/http"
	businessPostgres "crm/internal/business/repository/postgres"
	businessUseCase "crm/internal/business/usecase"
	"crm/internal/config"
	"crm/pkg/auth/jwtImpl"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"time"

	"github.com/gin-gonic/gin"
)

// Run ...
func Run(confpath string) error {
	conf, err := config.Init(confpath)
	if err != nil {
		fmt.Println(err)
		return err
	}

	rout := gin.Default()

	jwtToken, err := jwtImpl.NewJWT(conf.JWT.SigningKey, int64(conf.JWT.ExpiredDuration))

	if err != nil {
		fmt.Println(err)
		return err
	}
	// urlExample := "postgres://username:password@localhost:5432/database_name"
	dburl := fmt.Sprintf("%s://%s:%s@%s:%s/%s", conf.Database.DBMS, conf.Database.Username, conf.Database.Password, conf.Database.Host, conf.Database.Port, conf.Database.Dbname)
	fmt.Println("db url = ", dburl)

	dbAuthRepo := authPostgres.NewDatabase(dburl)
	userAuthRepo := authPostgres.NewUserRepository(dbAuthRepo)
	userAuthUseCase := authUseCase.NewAuthUseCase(userAuthRepo, jwtToken)
	userAuthHandler := authHttp.NewUserHandler(userAuthUseCase)
	safeGroup := userAuthHandler.RegisterUser("auth", rout)

	dbBusinessRepo := businessPostgres.NewDatabase(dburl)
	userRepo := businessPostgres.NewUserRepository(dbBusinessRepo)
	UserUseCase := businessUseCase.NewUserUseCase(userRepo)
	userHandler := businessHttp.NewUserHandler(UserUseCase)
	userHandler.RegisterUser("business", safeGroup)

	safeGroup.GET("/test", func(c *gin.Context) {
		c.JSON(200, "hello")
	})

	httpServer := &http.Server{
		Addr:           conf.Http.Port,
		Handler:        rout,
		ReadTimeout:    conf.Http.ReadTimeout,
		WriteTimeout:   conf.Http.WriteTimeout,
		MaxHeaderBytes: conf.Http.MaxHeaderMegabytes << 20,
	}

	go func() {
		if err := httpServer.ListenAndServe(); err != nil {
			log.Fatalf("Failed to listen and serve: %+v", err)
		}
	}()

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt, os.Interrupt)

	<-quit

	fmt.Println("Shutting down the Server ...")
	ctx, shutdown := context.WithTimeout(context.Background(), 5*time.Second)

	defer func() {
		fmt.Println("The Server stopped .. Zzzz ..")
		fmt.Println("closing auth db error =>", dbAuthRepo.Close())
		fmt.Println("closing business db error => ", dbBusinessRepo.Close())
		shutdown()
	}()

	fmt.Println("Server Exiting")

	return httpServer.Shutdown(ctx)
}
