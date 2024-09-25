package com.rafiqul.crmspring.service;

import com.rafiqul.crmspring.entity.Role;
import com.rafiqul.crmspring.entity.User;
import com.rafiqul.crmspring.repository.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public User createUser(User user) {
//        validateSuperior(user);  // Validate superior before saving
        return userRepository.save(user);
    }

    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Transactional
    public User updateUser(Long id, User userDetails) {
        User existingUser = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("User not found with id: " + id));

        // Update user fields
        existingUser.setName(userDetails.getName());
        existingUser.setEmail(userDetails.getEmail());
        existingUser.setPhone(userDetails.getPhone());
        existingUser.setRole(userDetails.getRole());
        existingUser.setStatus(userDetails.getStatus());
//        existingUser.setSuperior(userDetails.getSuperior());

        // Validate superior based on role before updating
//        validateSuperior(existingUser);

        return userRepository.save(existingUser);
    }

    @Transactional
    public void deleteUser(Long id) {
        User existingUser = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("User not found with id: " + id));

        userRepository.delete(existingUser);
    }


//    private void validateSuperior(User user) {
//        if (user.getRole() == Role.ADMIN) {
//            // Admin should not have a superior
//            if (user.getSuperior() != null) {
//                throw new IllegalArgumentException("Admin users should not have a superior.");
//            }
//        } else if (user.getRole() == Role.SALES_EXECUTIVE) {
//            // Sales Executive's superior should be Admin
//            if (user.getSuperior() == null || user.getSuperior().getRole() != Role.ADMIN) {
//                throw new IllegalArgumentException("Sales Executives must report to an Admin.");
//            }
//        } else if (user.getRole() == Role.AGENT) {
//            // Agent's superior should be Sales Executive
//            if (user.getSuperior() == null || user.getSuperior().getRole() != Role.SALES_EXECUTIVE) {
//                throw new IllegalArgumentException("Agents must report to a Sales Executive.");
//            }
//        }
//    }

}
