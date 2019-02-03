package com.danielbyun.loginRegistrationMultiroles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    @GetMapping("/")
    public String showHome() {
        return "home";
    }

    @GetMapping("/managers")
    public String showLeaders() {
        return "leaders";
    }

    @GetMapping("/admin")
    public String showOwner() {
        return "admin";
    }
}
