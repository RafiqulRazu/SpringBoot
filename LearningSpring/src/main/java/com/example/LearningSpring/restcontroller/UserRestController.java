package com.example.LearningSpring.restcontroller;

import com.example.LearningSpring.entity.User;
import com.example.LearningSpring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/user")
public class UserRestController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @PostMapping("/save")
    public void saveUser(@RequestBody User user) {
        userService.saveUser(user);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteUser(@PathVariable int id) {
        userService.deleteUserById(id);
    }

    @PutMapping("/update")
    public void updateUser(@RequestBody User user) {
        userService.saveUser(user);
    }
}
