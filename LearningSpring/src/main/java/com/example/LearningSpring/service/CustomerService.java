package com.example.LearningSpring.service;

import com.example.LearningSpring.entity.Customer;
import com.example.LearningSpring.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    public void saveCustomer(Customer customer) {
        customerRepository.save(customer);
    }
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }
    public Customer getCustomerById(int id) {
        return customerRepository.findById(id).get();
    }
    public void deleteCustomerById(int id) {
        customerRepository.deleteById(id);
    }
    public void updateCustomer(Customer customer, int id) {
        customerRepository.save(customer);
    }

}
