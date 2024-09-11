package com.example.LearningSpring.restcontroller;

import com.example.LearningSpring.entity.Customer;
import com.example.LearningSpring.service.CustomerService;
import jakarta.persistence.Id;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customer/api")
public class CustomerRestController {

    @Autowired
    private CustomerService customerService;

    @GetMapping("/")
    public List<Customer> getAllCustomers() {
        return customerService.getAllCustomers();
    }

    @PostMapping("/save")
    public void saveCustomer(@RequestBody Customer customer) {
        customerService.saveCustomer(customer);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteCustomer(@PathVariable int id) {
        customerService.deleteCustomerById(id);
    }

    @PutMapping("/update/{id}")
    public void updateCustomer(@RequestBody Customer customer, @PathVariable int id) {
        customerService.updateCustomer(customer, id);
    }
}
