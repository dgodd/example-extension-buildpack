package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"os/exec"
)

func envHandler(w http.ResponseWriter, r *http.Request) {
	for _, line := range os.Environ() {
		fmt.Fprintf(w, "%s\n", line)
	}
}

func handler(w http.ResponseWriter, r *http.Request) {
	out, err := exec.Command("mysupplied.bat").Output()
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		fmt.Fprintf(w, "ERROR: %s", err)
		return
	}
	fmt.Fprintf(w, "%s", out)
}

func main() {
	http.HandleFunc("/env", envHandler)
	http.HandleFunc("/", handler)
	fmt.Println("About to start listening on port 8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
	fmt.Println("About to exit main.go")
}
