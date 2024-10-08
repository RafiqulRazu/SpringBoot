package com.example.LearningSpring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User  {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String username;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)  // Store the enum as a string in the database
    @Column(nullable = false)
    private Role role;  // Role enum inside the User class

    // Defining the Role enum inside the User class
    public enum Role {
        ADMIN,
        SALES_EXECUTIVE,
        AGENT;
    }

}
