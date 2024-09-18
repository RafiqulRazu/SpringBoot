package com.example.FinalProject.service;

import com.example.FinalProject.entity.Customer;
import com.example.FinalProject.repository.CustomerRepository;
import com.example.FinalProject.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public ApiResponse saveCustomer(Customer customer) throws IOException{
        ApiResponse apiResponse = new ApiResponse();
        try {
            customerRepository.save(customer);
            apiResponse.setSuccessful(true);
            apiResponse.setMessage("Customer saved successfully");
            return apiResponse;
        }
        catch (Exception e){
            apiResponse.setMessage(e.getMessage());
            return apiResponse;
        }
    }

    public ApiResponse getAllCustomer() {
        ApiResponse apiResponse = new ApiResponse();
        try {
            List<Customer> customer = customerRepository.findAll();

            Map<String, Object> map = new HashMap<>();
            map.put("customer", customer);

            apiResponse.setData(map);
            apiResponse.setSuccessful(true);
            apiResponse.setMessage("All Customers found");
            return apiResponse;
        } catch (Exception e) {
            apiResponse.setMessage(e.getMessage());
            return apiResponse;
        }
    }

    public void deleteCustomer(Long id) {
        customerRepository.deleteById(id);
    }

    public Customer getCustomerById(Long id) {
        return customerRepository.findById(id).get();
    }

    public void updateCustomer(Customer customer) {
        customerRepository.save(customer);
    }
}
