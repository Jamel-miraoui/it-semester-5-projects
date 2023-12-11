package com.example.tp9;

public class user {
    String id ;
    String number ;
    public user(){}

    public user(String name , String phone){
        this.id = name ;
        this.number = phone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
}
