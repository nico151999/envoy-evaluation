package server

import (
	"fmt"
	"net/http"
)

var _ http.Handler = (*server)(nil)

type server struct{}

func NewServer() *server {
	return &server{}
}

func (s *server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("received request: %s %s\n", r.Method, r.RequestURI)
	w.Write([]byte("Hallihallo\n"))
	fmt.Println("finalizing response...")
}
