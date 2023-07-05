package main

import (
	"fmt"
	"net/http"

	"github.com/nico151999/envoy_gateway_evaluation/internal/server"
)

func main() {
	mux := http.NewServeMux()
	srv := server.NewServer()
	mux.HandleFunc("/readyz", func(w http.ResponseWriter, r *http.Request) {})
	mux.HandleFunc("/alivez", func(w http.ResponseWriter, r *http.Request) {})
	mux.Handle("/", srv)
	fmt.Println("Starting service now")
	if err := http.ListenAndServe(":8080", mux); err != nil {
		panic(err)
	}
	fmt.Printf("finished running...")
	// TODO: start server
}
