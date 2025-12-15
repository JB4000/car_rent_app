package com.pug.car_rent_app.controller;

import com.pug.car_rent_app.service.AppUsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    private AppUsersService appUsersService;

    // Display login page
    @GetMapping("/")
    public String showLoginPage() {
        return "login";
    }

    // Handle login submission
    @PostMapping("/")
    public String login(@RequestParam String username,
                        @RequestParam String password) {

        if (appUsersService.validateLogin(username, password)) {
            String role = appUsersService.getRole(username);

            switch (role) {
                case "1":
                    return "redirect:dataregmain";
                case "2":
                    return "redirect:workshop";
                case "3":
                    return "redirect:/forrudvik";
            }
        }

        return "redirect:/";
    }
}

