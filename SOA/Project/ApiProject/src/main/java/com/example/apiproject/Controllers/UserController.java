package com.example.apiproject.Controllers;

import com.example.apiproject.Models.User;
import com.example.apiproject.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@RestController
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    private UserService userService ;

    @GetMapping
    public ResponseEntity<List<User>> getAllUser(){
        List<User> users = userService.getAllUser();
        return ResponseEntity.ok(users) ;
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUSerById(@PathVariable int id){
        User user = userService.getUserById(id);
        return ResponseEntity.ok(user);
    }

    @PostMapping
    public ResponseEntity<User> addUser(@RequestBody User user ){
        User addeduser = userService.addUser(user);
        return ResponseEntity.ok(addeduser);
    }

    @DeleteMapping
    public ResponseEntity<String> addUser(@PathVariable int id ){
        userService.deleteUSer(id);
        return ResponseEntity.ok("User "+id+" :Delete With succes ");
    }

    @PutMapping
    public ResponseEntity<User> addUser(@PathVariable int id,@RequestBody User user ){
        User updateUSer = userService.updateUser(id,user);
        return ResponseEntity.ok(updateUSer);
    }
}
