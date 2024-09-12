package com.example.LearningSpring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;


@Entity
@Table(name="activity_log")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ActivityLog {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String activityType; // 'Call', 'Email', 'Meeting'

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private LocalDate activityDate;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user; // The user (agent or sales executive) who performed the activity


}
