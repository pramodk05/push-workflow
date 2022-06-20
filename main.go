package main

import (
	"fmt"
	"log"
	"net/http"
)

var version = "0.2.0"

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Welcome to my website! Version %s", version)
	})
	fmt.Printf("App is starting, version: %s \n", version)
	log.Fatal(http.ListenAndServe(":8500", nil))
}
