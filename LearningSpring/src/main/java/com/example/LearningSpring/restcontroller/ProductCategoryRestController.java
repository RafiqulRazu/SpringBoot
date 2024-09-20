package com.example.LearningSpring.restcontroller;

import com.example.LearningSpring.entity.ProductCategory;
import com.example.LearningSpring.repository.ProductCategoryRepository;
import com.example.LearningSpring.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/category")
@CrossOrigin("*")
public class  ProductCategoryRestController {

    @Autowired
    private ProductCategoryService productCategoryService;
    @Autowired
    private ProductCategoryRepository productCategoryRepository;

    @GetMapping("/")
    public ResponseEntity<List<ProductCategory>> getAllProductCategory() {
        List<ProductCategory> productCategory = productCategoryRepository.findAll();
        return ResponseEntity.status(HttpStatus.OK).body(productCategory);
    }

}
