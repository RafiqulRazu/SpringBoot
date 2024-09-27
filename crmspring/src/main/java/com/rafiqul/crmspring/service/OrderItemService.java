//package com.rafiqul.crmspring.service;
//
//import com.rafiqul.crmspring.entity.OrderItem;
//import com.rafiqul.crmspring.repository.OrderItemRepository;
//import jakarta.transaction.Transactional;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//import java.util.Optional;
//
//@Service
//public class OrderItemService {
//
//    @Autowired
//    private OrderItemRepository orderItemRepository;
//
//
//    @Transactional
//    public OrderItem createOrderItem(OrderItem orderItem) {
//        return orderItemRepository.save(orderItem);
//    }
//
//    public Optional<OrderItem> getOrderItemById(Long id) {
//        return orderItemRepository.findById(id);
//    }
//
//    public List<OrderItem> getAllOrderItems() {
//        return orderItemRepository.findAll();
//    }
//
//    @Transactional
//    public OrderItem updateOrderItem(Long id, OrderItem updatedOrderItem) {
//        Optional<OrderItem> existingOrderItemOptional = orderItemRepository.findById(id);
//
//        if (existingOrderItemOptional.isPresent()) {
//            OrderItem existingOrderItem = existingOrderItemOptional.get();
//            existingOrderItem.setQuantity(updatedOrderItem.getQuantity());
//            existingOrderItem.setUnitPrice(updatedOrderItem.getUnitPrice());
//            existingOrderItem.setTotalPrice(updatedOrderItem.getTotalPrice());
//            existingOrderItem.setProduct(updatedOrderItem.getProduct());
//            return orderItemRepository.save(existingOrderItem);
//        } else {
//            throw new RuntimeException("OrderItem not found with id " + id);
//        }
//    }
//
//    @Transactional
//    public void deleteOrderItem(Long id) {
//        if (orderItemRepository.existsById(id)) {
//            orderItemRepository.deleteById(id);
//        } else {
//            throw new RuntimeException("OrderItem not found with id " + id);
//        }
//    }
//
//    public List<OrderItem> getOrderItemsByOrderId(Long orderId) {
//        return orderItemRepository.findByOrderId(orderId);
//    }
//
//    @Transactional
//    public void deleteOrderItemsByOrderId(Long orderId) {
//        orderItemRepository.deleteByOrderId(orderId);
//    }
//}
