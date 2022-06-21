package com.codeup.adlister.dao;

class Config {

    //TODO: Create a class named com.codeup.adlister.dao.Config.java that will hold our database configuration This class should have three
    // public methods, getUrl, getUsername, and getPassword, all of which should return strings for those properties.
    public String getURL(){
        return "jdbc:mysql://localhost:3306/adlister_db?allowPublicKeyRetrieval=true&useSSL=false";
    }

    public String getUsername(){
        return "adlister";
    }

    public String getPassword(){
        return "codeup";
    }

}
