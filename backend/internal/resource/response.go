package res

type Response struct {
	Success bool           `json:"success"`
	Data    *interface{}   `json:"data"`
	Error   *ErrorResponse `json:"error"`
}

type ErrorResponse struct {
	Code    int    `json:"code"`
	Message string `json:"message"`
}
