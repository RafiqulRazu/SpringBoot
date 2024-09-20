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
        List<Product> productList = productService.getAllProduct();
        return ResponseEntity.ok(productList);
    }

    @GetMapping("/p/searchProduct")
    public ResponseEntity<List<Product>> findProductByCategoryName(@RequestParam(value = "categoryName")String categoryName) {
        List<Product> productList = productService.findProductByCategoryName(categoryName);
        return ResponseEntity.ok(productList);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product>findProductById(@PathVariable int id){
        try {
            Product product=productService.findById(id);
            return ResponseEntity.ok(product);
        }
        catch (RuntimeException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @DeleteMapping("/delete/{id}")
    public void deleteProduct(@PathVariable int id) {

        productService.deleteProductById(id);
    }



    
}
