//package com.rafiqul.crmspring.entity;
//
//import jakarta.persistence.*;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//import java.time.LocalDate;
//import java.util.List;
//
//@Entity
//@Data
//@Table(name = "orders")
//@AllArgsConstructor
//@NoArgsConstructor
//public class Order {
//
//    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private  long id;
//
//    @ManyToOne
//    @JoinColumn(name = "lead_id", nullable = false)
//    private Lead lead;
//
////    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
////    private List<OrderItem> orderItems;
//
//    private LocalDate orderDate;
//
//    private double totalAmount;  // Total amount for the order
//
//    private String status;
//
//
//}
