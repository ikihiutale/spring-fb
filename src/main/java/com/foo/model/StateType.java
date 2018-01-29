package com.foo.model;

public enum StateType {
	 
    ACTIVE("Active"),
    INACTIVE("Inactive"),
    DELETED("Deleted"),
    LOCKED("Locked");
     
    private String stateTypeStr;
     
    private StateType(final String stateType) {
        this.stateTypeStr = stateType;
    }
     
    public String getStateType() {
        return stateTypeStr;
    }
 
    @Override
    public String toString() {
        return stateTypeStr;
    }
 
    public String getName() {
        return this.name();
    }
}