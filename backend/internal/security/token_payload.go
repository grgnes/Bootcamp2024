package sec

import (
	"errors"
	"github.com/docker/distribution/uuid"
	"time"
)

// Different types of error returned by the VerifyToken function
var (
	ErrInvalidToken = errors.New("token is invalid")
	ErrExpiredToken = errors.New("token has expired")
)

// TokenPayload contains the payload data of the token
type TokenPayload struct {
	ID        uuid.UUID `json:"id"`
	UserId    int64     `json:"user_id"`
	IssuedAt  time.Time `json:"issued_at"`
	ExpiredAt time.Time `json:"expired_at"`
}

// NewTokenPayload creates a new token payload with a specific username and duration
func NewTokenPayload(userID int64, duration time.Duration) (*TokenPayload, error) {
	tokenID := uuid.Generate()
	payload := &TokenPayload{
		ID:        tokenID,
		UserId:    userID,
		IssuedAt:  time.Now(),
		ExpiredAt: time.Now().Add(duration),
	}
	return payload, nil
}

// Valid checks if the token payload is valid or not
func (payload *TokenPayload) Valid() error {
	if time.Now().After(payload.ExpiredAt) {
		return ErrExpiredToken
	}
	return nil
}
