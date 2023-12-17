package com.example.apiproject.Service;

import com.example.apiproject.Models.User;
import com.example.apiproject.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository ;

    public User addUser(User user){
        return userRepository.save(user);
    }

    public List<User> getAllUser(){
        return userRepository.findAll();
    }

    public User getUserById(int id){
        return userRepository.getReferenceById(id);
    }

    public User updateUser(int userID,User newUser) {
        User oldUSer = userRepository.findById(userID)
                .orElseThrow(() -> new RuntimeException("User not found with user_id: " + userID));
        oldUSer.setFullName(newUser.getFullName());
        return userRepository.save(oldUSer);
    }
    public void deleteUSer(int userID){
        userRepository.deleteById(userID);
    }
}
