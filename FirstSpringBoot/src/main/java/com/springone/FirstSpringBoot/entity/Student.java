package com.springone.FirstSpringBoot.entity;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false, length = 40, name = "studentName")
    private String name;
    @Column(nullable = false, unique = true)
    private String email ;
    @Column(nullable = false, unique = true)
    private String cell;

    private String gender;

    private Date dob;
}
