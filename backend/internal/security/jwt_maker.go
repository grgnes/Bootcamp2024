package sec

import (
	"errors"
	"fmt"
	"github.com/golang-jwt/jwt"
	"time"
)

const minSecretKeySize = 32

// JWT is a JSON Web Token maker
type JWT struct {
	secretKey string
}

// NewJWT creates a new JWTTokenMaker
func NewJWT(secretKey string) (Token, error) {
	if len(secretKey) < minSecretKeySize {
		return nil, fmt.Errorf("invalid key size: must be at least %d characters", minSecretKeySize)
	}
	return &JWT{secretKey}, nil
}

// Generate creates a new token for a specific username and duration
func (maker *JWT) Generate(userId int64, duration time.Duration) (string, *TokenPayload, error) {
	payload, err := NewTokenPayload(userId, duration)
	if err != nil {
		return "", payload, err
	}

	jwtToken := jwt.NewWithClaims(jwt.SigningMethodHS256, payload)
	token, err := jwtToken.SignedString([]byte(maker.secretKey))
	return token, payload, err
}

// Verify checks if the token is valid or not
func (maker *JWT) Verify(token string) (*TokenPayload, error) {
	keyFunc := func(token *jwt.Token) (interface{}, error) {
		_, ok := token.Method.(*jwt.SigningMethodHMAC)
		if !ok {
			return nil, ErrInvalidToken
		}
		return []byte(maker.secretKey), nil
	}

	jwtToken, err := jwt.ParseWithClaims(token, &TokenPayload{}, keyFunc)
	if err != nil {
		var verr *jwt.ValidationError
		ok := errors.As(err, &verr)
		if ok && errors.Is(verr.Inner, ErrExpiredToken) {
			return nil, ErrExpiredToken
		}
		return nil, ErrInvalidToken
	}

	payload, ok := jwtToken.Claims.(*TokenPayload)
	if !ok {
		return nil, ErrInvalidToken
	}

	return payload, nil
}
