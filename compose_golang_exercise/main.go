package main

import (
	"fmt"
	"net/http"
	"gopkg.in/mgo.v2"
	"gopkg.in/mgo.v2/bson"
	"time"
)

type Ping struct {
	Id   bson.ObjectId `bson:"_id"`
	Time time.Time     `bson:"time"`
}

func handler(w http.ResponseWriter, r *http.Request) {

	session, err := mgo.Dial("localhost")
	if err != nil {
		panic(err)
	}
	db := session.DB("aaa")
	defer session.Close()

	ping := Ping{
		Id:   bson.NewObjectId(),
		Time: time.Now(),
	}

	db.C("pings").Insert(ping)
	// get all records
	pings := []Ping{}
	db.C("pings").Find(nil).All(&pings)

	fmt.Fprintf(w, "%s", pings)
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}