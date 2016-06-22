package main

import (
	"fmt"
	"github.com/ricardo-rossi/meetup"
	"net/http"
)

const host = "0.0.0.0:3000"

type context struct{}

func main() {

	fmt.Println("Starting server on http://" + host)
	router := web.New(context{})
	router.Get("/", func(rw web.ResponseWriter, req *web.Request) {
		fmt.Fprint(rw, "<h1>Hello Meetup!!!!</h1>")
	})
	http.ListenAndServe(host, router)
}
