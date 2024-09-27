//package com.rafiqul.crmspring.restcontroller;
//
//import com.rafiqul.crmspring.entity.OrderItem;
//import com.rafiqul.crmspring.service.OrderItemService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@RestController
//@RequestMapping("/api/item")
//public class OrderItemController {
//
//    @Autowired
//    private OrderItemService orderItemService;
//
//    @PostMapping("/save")
//    public ResponseEntity<OrderItem> createOrderItem( @RequestBody OrderItem orderItem) {
//        OrderItem createdOrderItem = orderItemService.createOrderItem(orderItem);
//        return new ResponseEntity<>(createdOrderItem, HttpStatus.CREATED);
//    }
//
//    @GetMapping("/{id}")
//    public ResponseEntity<OrderItem> getOrderItemById(@PathVariable Long id) {
//        return orderItemService.getOrderItemById(id)
//                .map(orderItem -> new ResponseEntity<>(orderItem, HttpStatus.OK))
//                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
//    }
//
//    @GetMapping("/")
//    public ResponseEntity<List<OrderItem>> getAllOrderItems() {
//        List<OrderItem> orderItems = orderItemService.getAllOrderItems();
//        return new ResponseEntity<>(orderItems, HttpStatus.OK);
//    }
//
//    @PutMapping("update/{id}")
//    public ResponseEntity<OrderItem> updateOrderItem(@PathVariable Long id, @RequestBody OrderItem updatedOrderItem) {
//        try {
//            OrderItem orderItem = orderItemService.updateOrderItem(id, updatedOrderItem);
//            return new ResponseEntity<>(orderItem, HttpStatus.OK);
//        } catch (RuntimeException e) {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
//
//    @DeleteMapping("delete/{id}")
//    public ResponseEntity<Void> deleteOrderItem(@PathVariable Long id) {
//        try {
//            orderItemService.deleteOrderItem(id);
//            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//        } catch (RuntimeException e) {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
//
//    @GetMapping("/order/{orderId}")
//    public ResponseEntity<List<OrderItem>> getOrderItemsByOrderId(@PathVariable Long orderId) {
//        List<OrderItem> orderItems = orderItemService.getOrderItemsByOrderId(orderId);
//        return new ResponseEntity<>(orderItems, HttpStatus.OK);
//    }
//}
