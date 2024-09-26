package com.rafiqul.crmspring.service;

import com.rafiqul.crmspring.entity.Order;
import com.rafiqul.crmspring.entity.OrderItem;
import com.rafiqul.crmspring.repository.OrderItemRepository;
import com.rafiqul.crmspring.repository.OrderRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Transactional
    public Order createOrder(Order order) {
        // Calculate total amount based on order items
        double totalAmount = 0.0;
        for (OrderItem item : order.getOrderItems()) {
            item.setOrder(order); // Set the reference to the parent order
            double totalPrice = item.getUnitPrice() * item.getQuantity();
            item.setTotalPrice(totalPrice);
            totalAmount += totalPrice;
        }
        order.setTotalAmount(totalAmount);
        return orderRepository.save(order);
    }

    public Optional<Order> getOrderById(Long id) {
        return orderRepository.findById(id);
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    @Transactional
    public Order updateOrder(Long id, Order updatedOrder) {
        Optional<Order> existingOrderOptional = orderRepository.findById(id);

        if (existingOrderOptional.isPresent()) {
            Order existingOrder = existingOrderOptional.get();

            // Update order fields
            existingOrder.setStatus(updatedOrder.getStatus());
            existingOrder.setOrderDate(updatedOrder.getOrderDate());

            // Update the order items
            orderItemRepository.deleteByOrderId(existingOrder.getId()); // Delete old order items

            double totalAmount = 0.0;
            for (OrderItem item : updatedOrder.getOrderItems()) {
                item.setOrder(existingOrder);  // Set the parent order reference
                double totalPrice = item.getUnitPrice() * item.getQuantity();
                item.setTotalPrice(totalPrice);
                totalAmount += totalPrice;
                orderItemRepository.save(item); // Save the updated order items
            }

            existingOrder.setTotalAmount(totalAmount);
            return orderRepository.save(existingOrder);
        } else {
            throw new RuntimeException("Order not found with id " + id);
        }
    }

    @Transactional
    public void deleteOrder(Long id) {
        if (orderRepository.existsById(id)) {
            orderItemRepository.deleteByOrderId(id);  // Delete associated order items
            orderRepository.deleteById(id);  // Delete the order
        } else {
            throw new RuntimeException("Order not found with id " + id);
        }
    }

    // LIST OrderItems for a specific Order
    public List<OrderItem> getOrderItemsByOrderId(Long orderId) {
        return orderItemRepository.findByOrderId(orderId);
    }
}
