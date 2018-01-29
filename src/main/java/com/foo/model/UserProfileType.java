package com.foo.model;

public enum UserProfileType {
    USER("USER"),
    ADMIN("ADMIN");
     
    String userProfileTypeStr;
     
    private UserProfileType(String userProfileType){
        this.userProfileTypeStr = userProfileType;
    }
     
    public String getUserProfileType(){
        return userProfileTypeStr;
    }
     
}