package com.example.LearningSpring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Data
@Table(name = "order")
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private LocalDate orderDate;
    private double totalAmount;

    // Relationships
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "sales_executive_id")
    private User salesExecutive;

//    @OneToMany(mappedBy = "order")
//    private List<OrderItem> orderItems;

}
