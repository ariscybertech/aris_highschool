package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"time"

	"github.com/google/uuid"
	"github.com/gorilla/mux"
)

// Main function
func main() {
	results = append(results, time.Now().Format(time.RFC3339))

	r := mux.NewRouter()
	r.HandleFunc("/api/login", PostHandler).Methods("POST")
	r.HandleFunc("/api/login", GetHandler).Methods("GET")
	log.Fatal(http.ListenAndServe(":8080", r))

}

var results []string

// GetHandler handles the index route
func GetHandler(w http.ResponseWriter, r *http.Request) {

	jsonBody, err := json.Marshal(results)
	if err != nil {
		http.Error(w, "Error converting results to json",
			http.StatusInternalServerError)
	}
	var birds []string
	json.Unmarshal([]byte(jsonBody), &birds)
	fmt.Print("aa", birds)
	w.Write(jsonBody)
}

//User online
type User struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

//UserToken retrive id
type UserToken struct {
	UserID string `json:"userID"`
}

// PostHandler control username password
func PostHandler(w http.ResponseWriter, r *http.Request) {

	if r.Method == "POST" {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			http.Error(w, "Error reading request body",
				http.StatusInternalServerError)
		}

		results = append(results, string(body))
		fmt.Print("aa", string(body))

		birdJSON := string(body)
		var user User
		json.Unmarshal([]byte(birdJSON), &user)
		fmt.Printf("Species: %s, Description: %s", user.Password, user.Username)
		w.Header().Set("Content-Type", "application/json")

		// json.NewEncoder(w).Encode(user)
		if user.Username == "veli" && user.Password == "12345" {
			w.WriteHeader(http.StatusOK)
			id, err := uuid.NewUUID()
			if err != nil {
				// handle error
				print("not genarated uui.")
			}
			// fmt.Printf(id.String())
			// fmt.Fprint(w, id.String())
			var token UserToken
			token.UserID = id.String()
			json.NewEncoder(w).Encode(token)

		} else {
			w.WriteHeader(http.StatusNotFound)
		}

		//write response data
		// json.NewEncoder(w).Encode(user)
		// fmt.Fprint(w, user.password)
	} else {
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
	}

}
