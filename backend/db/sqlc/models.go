// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0

package db

import (
	"database/sql/driver"
	"fmt"
	"net/netip"

	"github.com/jackc/pgx/v5/pgtype"
)

type Roles string

const (
	RolesADMIN Roles = "ADMIN"
	RolesUSER  Roles = "USER"
)

func (e *Roles) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = Roles(s)
	case string:
		*e = Roles(s)
	default:
		return fmt.Errorf("unsupported scan type for Roles: %T", src)
	}
	return nil
}

type NullRoles struct {
	Roles Roles `json:"roles"`
	Valid bool  `json:"valid"` // Valid is true if Roles is not NULL
}

// Scan implements the Scanner interface.
func (ns *NullRoles) Scan(value interface{}) error {
	if value == nil {
		ns.Roles, ns.Valid = "", false
		return nil
	}
	ns.Valid = true
	return ns.Roles.Scan(value)
}

// Value implements the driver Valuer interface.
func (ns NullRoles) Value() (driver.Value, error) {
	if !ns.Valid {
		return nil, nil
	}
	return string(ns.Roles), nil
}

type Session struct {
	ID           int64       `json:"id"`
	UserID       int64       `json:"user_id"`
	RefreshToken string      `json:"refresh_token"`
	UserAgent    []string    `json:"user_agent"`
	ClientIp     netip.Addr  `json:"client_ip"`
	IsBlocked    bool        `json:"is_blocked"`
	CreatedAt    interface{} `json:"created_at"`
	UpdatedAt    interface{} `json:"updated_at"`
}

type User struct {
	ID        int64       `json:"id"`
	Role      Roles       `json:"role"`
	Name      []string    `json:"name"`
	Email     []string    `json:"email"`
	Password  []string    `json:"password"`
	Address   pgtype.Text `json:"address"`
	Rating    float32     `json:"rating"`
	CreatedAt interface{} `json:"created_at"`
	UpdatedAt interface{} `json:"updated_at"`
}
