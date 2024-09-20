package com.example.FinalProject.restcontroller;

import com.example.FinalProject.entity.Product;
import com.example.FinalProject.service.ProductService;
import com.example.FinalProject.util.ApiResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/product")
@CrossOrigin("*")
public class ProductController {

    @Autowired
    private ProductService productService;

    @PostMapping("/save")

//    public ApiResponse saveProduct(
//            @RequestPart(value = "product") Product product,
//            @RequestParam(value = "image", required = true) MultipartFile file
//    ) throws IOException {
//        ApiResponse apiResponse = productService.saveProduct(product, file);
//        return apiResponse;
//    }
    public ResponseEntity<String> saveProduct(
            @RequestPart(value = "product") String productJson,
            @RequestPart(value = "image") MultipartFile file
    ) throws IOException {

        // Convert JSON string to Hotel object
        ObjectMapper objectMapper = new ObjectMapper();
        Product product = objectMapper.readValue(productJson, Product.class);

        // Save the hotel and the image
        try {
            productService.saveProduct(product, file);
            return new ResponseEntity<>("Product added successfully with image.", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Failed to add Product: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @GetMapping("/")
    public ResponseEntity<List<Product>> getAllProduct() {
        List<Product> products = productService.getAllProduct();
        return ResponseEntity.ok(products);
    }
}
