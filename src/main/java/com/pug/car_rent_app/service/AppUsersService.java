package com.pug.car_rent_app.service;
import com.pug.car_rent_app.model.login.AppUsers;
import com.pug.car_rent_app.repository.AppUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AppUsersService {

    @Autowired
    private AppUserRepository appUserRepository;

    // HashMaps for quick lookup
    private final Map<String, String> userPasswords = new HashMap<>();
    private final Map<String, String> userRoles = new HashMap<>();

    // Load users from database into HashMaps
    private void loadUsersFromDatabase() {
        List<AppUsers> users = appUserRepository.getAllAppUsers();
        for (AppUsers user : users) {
            String usernameKey = user.getUsername().toLowerCase();
            userPasswords.put(usernameKey, user.getPassword());
            userRoles.put(usernameKey, user.getRole());
        }
    }


    public boolean validateLogin(String username, String password) {
        if (userPasswords.isEmpty() || userRoles.isEmpty()) {
            loadUsersFromDatabase();
        }

        String usernameKey = username.toLowerCase(); // normalize input
        return userPasswords.containsKey(usernameKey) &&
                userPasswords.get(usernameKey).equals(password);
    }


    public String getRole(String username) {
        if (userRoles.isEmpty()) {
            loadUsersFromDatabase();
        }
        return userRoles.get(username);
    }
}

