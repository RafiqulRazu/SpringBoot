package com.rafiqul.crmspring.service;

import com.rafiqul.crmspring.entity.Order;
import com.rafiqul.crmspring.entity.OrderItem;
import com.rafiqul.crmspring.entity.Product;
import com.rafiqul.crmspring.repository.OrderItemRepository;
import com.rafiqul.crmspring.repository.OrderRepository;
import com.rafiqul.crmspring.repository.ProductRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    // Method to calculate total amount for the order based on its order items
    private void calculateTotalAmount(Order order) {
        double totalAmount = order.getOrderItems()
                .stream()
                .mapToDouble(OrderItem::getTotalPrice)  // Sum of all OrderItem prices
                .sum();
        order.setTotalAmount(totalAmount);  // Set the calculated total amount
    }

    // Create a new order
    public Order createOrder(Order order) {
        calculateTotalAmount(order);  // Calculate total before saving
        return orderRepository.save(order);
    }

    // Update an order
    public Order updateOrder(long id, Order updatedOrder) {
        Optional<Order> existingOrderOptional = orderRepository.findById(id);

        if (existingOrderOptional.isPresent()) {
            Order existingOrder = existingOrderOptional.get();
            existingOrder.setLead(updatedOrder.getLead());
            existingOrder.setOrderItems(updatedOrder.getOrderItems());
            existingOrder.setOrderDate(updatedOrder.getOrderDate());
            existingOrder.setStatus(updatedOrder.getStatus());

            calculateTotalAmount(existingOrder);  // Recalculate total amount
            return orderRepository.save(existingOrder);
        }

        return null;
    }


    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public Order getOrderById(long id) {
        Optional<Order> orderOptional = orderRepository.findById(id);
        return orderOptional.orElse(null);
    }

    public boolean deleteOrder(long id) {
        Optional<Order> existingOrderOptional = orderRepository.findById(id);
        if (existingOrderOptional.isPresent()) {
            orderRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
