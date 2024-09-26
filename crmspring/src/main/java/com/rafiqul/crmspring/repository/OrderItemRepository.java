package com.rafiqul.crmspring.repository;

import com.rafiqul.crmspring.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

    // Custom method to delete all order items by order ID
    void deleteByOrderId(Long orderId);

    // Custom method to find all order items for a specific order
    List<OrderItem> findByOrderId(Long orderId);
}
