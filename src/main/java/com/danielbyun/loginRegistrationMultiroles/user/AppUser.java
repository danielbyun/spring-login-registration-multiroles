package com.danielbyun.loginRegistrationMultiroles.user;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class AppUser {
    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String userName;

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String password;

    private String formRole;

    public AppUser() {
    }

    public AppUser(@NotNull(message = "is required") @Size(min = 1, message = "is required") String userName, @NotNull(message = "is required") @Size(min = 1, message = "is required") String password, String formRole) {
        this.userName = userName;
        this.password = password;
        this.formRole = formRole;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFormRole() {
        return formRole;
    }

    public void setFormRole(String formRole) {
        this.formRole = formRole;
    }

    @Override
    public String toString() {
        return "AppUser{" +
                "userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", formRole='" + formRole + '\'' +
                '}';
    }
}
