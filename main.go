package main

import (
	"log"
	"net/http"
)

func main() {
	fs := http.FileServer(http.Dir("./web"))

	http.Handle("/", fs)

	log.Println("listening on :8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
