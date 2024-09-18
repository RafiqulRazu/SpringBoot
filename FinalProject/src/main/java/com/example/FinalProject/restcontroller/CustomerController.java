package com.example.FinalProject.restcontroller;

import com.example.FinalProject.entity.Customer;
import com.example.FinalProject.service.CustomerService;
import com.example.FinalProject.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/api/customer")
@CrossOrigin("*")
public class CustomerController {

    @Autowired
    CustomerService customerService;


    @PostMapping("/save")
    public ApiResponse saveCustomer(@RequestBody Customer customer) throws IOException {
        ApiResponse apiResponse = customerService.saveCustomer(customer);
        return apiResponse;
    }

    @GetMapping("/")
    public ApiResponse getAllCustomers(){
        return customerService.getAllCustomer();
    }

    @DeleteMapping("/delete/{id}")
    public void deleteCustomer(@PathVariable long id){
        customerService.getCustomerById(id);
    }

    @PutMapping("/update/{id}")
    public void updateCustomer(@RequestBody Customer customer){
        customerService.updateCustomer(customer);
    }
}
