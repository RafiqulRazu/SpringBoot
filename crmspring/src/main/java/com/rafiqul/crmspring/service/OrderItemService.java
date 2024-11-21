package com.rafiqul.crmspring.service;

import com.rafiqul.crmspring.entity.OrderItem;
import com.rafiqul.crmspring.repository.OrderItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderItemService {
    private final OrderItemRepository orderItemRepository;

    @Autowired
    public OrderItemService(OrderItemRepository orderItemRepository) {
        this.orderItemRepository = orderItemRepository;
    }

    // Save an OrderItem
    public OrderItem saveOrderItem(OrderItem orderItem) {
        return orderItemRepository.save(orderItem);
    }

    // Retrieve an OrderItem by ID
    public Optional<OrderItem> getOrderItemById(Long id) {
        return orderItemRepository.findById(id);
    }

    // Retrieve all OrderItems
    public List<OrderItem> getAllOrderItems() {
        return orderItemRepository.findAll();
    }

    // Update an OrderItem
    public OrderItem updateOrderItem(Long id, OrderItem orderItem) {
        return orderItemRepository.findById(id)
                .map(existingItem -> {
                    existingItem.setProduct(orderItem.getProduct());
                    existingItem.setQuantity(orderItem.getQuantity());
                    return orderItemRepository.save(existingItem);
                })
                .orElseThrow(() -> new RuntimeException("OrderItem not found with id: " + id));
    }

    // Delete an OrderItem by ID
    public void deleteOrderItem(Long id) {
        orderItemRepository.deleteById(id);
    }

}
