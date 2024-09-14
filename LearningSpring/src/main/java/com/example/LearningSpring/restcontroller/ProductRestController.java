package com.example.LearningSpring.restcontroller;

import com.example.LearningSpring.entity.Product;
import com.example.LearningSpring.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/product")
public class ProductRestController {

    @Autowired
    private ProductService productService;

    @PostMapping("/save")
    public ResponseEntity<String> saveProduct(@RequestPart Product product, @RequestParam(value="image") MultipartFile file) throws IOException {
        productService.saveProduct(product, file);
        return new ResponseEntity<>("product add", HttpStatus.OK);
    }

    @GetMapping("/")
    public ResponseEntity<List<Product>> getAllProduct() {
        List<Product> productList = productService.findAllProduct();
        return ResponseEntity.ok(productList);
    }
}
