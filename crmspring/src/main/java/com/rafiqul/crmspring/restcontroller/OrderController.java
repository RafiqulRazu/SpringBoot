//package com.rafiqul.crmspring.restcontroller;
//
//import com.rafiqul.crmspring.entity.Order;
//import com.rafiqul.crmspring.entity.OrderItem;
//import com.rafiqul.crmspring.service.OrderService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import java.util.Optional;
//
//@RestController
//@RequestMapping("/api/order")
//public class OrderController {
//
//    @Autowired
//    private OrderService orderService;
//
//    // Create Order
//    @PostMapping("/save")
//    public ResponseEntity<Order> createOrder(@RequestBody Order order) {
//        try {
//            Order createdOrder = orderService.createOrder(order);
//            return new ResponseEntity<>(createdOrder, HttpStatus.CREATED);
//        } catch (Exception e) {
//            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//
//
//    @GetMapping("/{id}")
//    public ResponseEntity<Order> getOrderById(@PathVariable("id") Long id) {
//        Optional<Order> orderData = orderService.getOrderById(id);
//
//        if (orderData.isPresent()) {
//            return new ResponseEntity<>(orderData.get(), HttpStatus.OK);
//        } else {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
//
//    // Get All Orders
//    @GetMapping
//    public ResponseEntity<List<Order>> getAllOrders() {
//        try {
//            List<Order> orders = orderService.getAllOrders();
//
//            if (orders.isEmpty()) {
//                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//            }
//            return new ResponseEntity<>(orders, HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//
//
//    @PutMapping("/update/{id}")
//    public ResponseEntity<Order> updateOrder(@PathVariable("id") Long id, @RequestBody Order order) {
//        try {
//            Order updatedOrder = orderService.updateOrder(id, order);
//            return new ResponseEntity<>(updatedOrder, HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
//
//    // Delete Order
//    @DeleteMapping("/delete/{id}")
//    public ResponseEntity<HttpStatus> deleteOrder(@PathVariable("id") Long id) {
//        try {
//            orderService.deleteOrder(id);
//            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//        } catch (Exception e) {
//            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//
//
//
//}
