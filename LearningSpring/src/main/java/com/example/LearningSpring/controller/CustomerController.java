package com.example.LearningSpring.controller;

import com.example.LearningSpring.entity.Customer;
import com.example.LearningSpring.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/savecustomerform")
    public String saveCustomer(Model model) {
        model.addAttribute("customer", new Customer());
        model.addAttribute("title", "Customer Form");
        return "savecustomerform";
    }
}
