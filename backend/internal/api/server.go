package api

import (
	"com.github/Dumran/amongus/configs"
	db "com.github/Dumran/amongus/db/sqlc"
	"com.github/Dumran/amongus/internal/resource"
	"com.github/Dumran/amongus/internal/security"
	"fmt"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

// Server serves HTTP requests for dream service
type Server struct {
	store  db.Store
	conf   configs.Config
	token  sec.Token
	router *echo.Echo
}

// NewServer creates a new HTTP server and set up routing.
func NewServer(config configs.Config, store db.Store) (*Server, error) {
	token, err := sec.NewJWT(config.TokenSymmetricKey)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	serv := &Server{
		conf:  config,
		store: store,
		token: token,
	}

	serv.setupRouter()
	return serv, nil
}

func (serv *Server) setupRouter() {
	e := echo.New()
	e.Use(middleware.CORS())
	e.Use(middleware.LoggerWithConfig(middleware.LoggerConfig{
		Format: "method=${method}, uri=${uri}, status=${status}\n",
	}))

	v1 := e.Group("/api/v1")
	v1.GET("/", func(c echo.Context) error {
		return c.String(200, "at")
	})

	//v1.POST("/register", serv.register)
	//v1.POST("/login", serv.login)
	//v1.POST("/renew_access", serv.renewAccessToken)
	//v1.GET("/version/:os", serv.getVersion)
	//v1.GET("/genders", serv.listGenders)
	//v1.GET("/configuration/:userId", serv.getConfiguration)
	//
	//authenticated := v1.Group("/").Use(authMiddleware(serv.tokenMaker))
	//authenticated.POST("/feedbacks", serv.feedback)
	//authenticated.GET("/stories/:userId", serv.getStoriesBrief)
	//authenticated.GET("/stories/:userId/content", serv.getStoriesContent)
	//authenticated.GET("/dailyLetter/:userId", serv.getDailyLetter)
	//authenticated.GET("/actions", serv.getActions)
	//authenticated.GET("/actions/:actionId/options", serv.getActionOptions)
	//authenticated.GET("/credit/:userId", serv.getCredit)

	serv.router = e
}

// Start runs the HTTP server on a specific address.
func (serv *Server) Start() error {
	if serv.conf.Environment == "development" {
		serv.router.Debug = true
	}
	return serv.router.Start(serv.conf.ServerAddress)
}

func (serv *Server) success(ctx echo.Context, data *interface{}) error {
	rsp := &res.Response{
		Success: true,
		Data:    data,
		Error:   nil,
	}
	return ctx.JSON(200, rsp)
}

func (serv *Server) err(ctx echo.Context, status int, code int, msg string) error {
	err := &res.ErrorResponse{
		Code:    code,
		Message: msg,
	}
	rsp := &res.Response{
		Success: false,
		Data:    nil,
		Error:   err,
	}
	return ctx.JSON(status, rsp)
}

func (serv *Server) abort() error {
	return nil
}
