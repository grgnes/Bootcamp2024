package sec

import "time"

// Token is an interface for managing tokens
type Token interface {
	// Generate creates a new token for a specific username and duration
	Generate(userID int64, duration time.Duration) (string, *TokenPayload, error)

	// Verify checks if the token is valid or not
	Verify(token string) (*TokenPayload, error)
}
