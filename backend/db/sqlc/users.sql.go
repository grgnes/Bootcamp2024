// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0
// source: users.sql

package db

import (
	"context"
)

const getUserByID = `-- name: GetUserByID :one
select id, role, name, email, password, address, rating, created_at, updated_at from users
where id = $1
`

func (q *Queries) GetUserByID(ctx context.Context, id int64) (User, error) {
	row := q.db.QueryRow(ctx, getUserByID, id)
	var i User
	err := row.Scan(
		&i.ID,
		&i.Role,
		&i.Name,
		&i.Email,
		&i.Password,
		&i.Address,
		&i.Rating,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}