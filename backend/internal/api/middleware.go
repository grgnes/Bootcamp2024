package api

import (
	"fmt"
	"github.com/labstack/echo/v4"
	"net/http"
	"strings"
)

const (
	authorizationHeaderKey  = "authorization"
	authorizationTypeBearer = "bearer"
	authorizationPayloadKey = "authorization_payload"
)

func (serv *Server) authMiddleware(next echo.HandlerFunc) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		authorizationHeader := ctx.Request().Header.Get(authorizationHeaderKey)

		if len(authorizationHeader) == 0 {
			return serv.err(ctx, http.StatusUnauthorized, 1000, "authorization header is not provided")
		}

		fields := strings.Fields(authorizationHeader)
		if len(fields) < 2 {
			return serv.err(ctx, http.StatusUnauthorized, 1001, "invalid authorization header format")
		}

		authorizationType := strings.ToLower(fields[0])
		if authorizationType != authorizationTypeBearer {
			return serv.err(ctx, http.StatusUnauthorized, 1002, fmt.Sprintf("unsupported authorization type %s", authorizationType))
		}

		accessToken := fields[1]
		payload, err := serv.token.Verify(accessToken)
		if err != nil {
			return serv.err(ctx, http.StatusUnauthorized, 1003, "cannot verify access token")
		}

		ctx.Set(authorizationPayloadKey, payload)
		return next(ctx)
	}
}
