package com.example.LearningSpring.restcontroller;

import com.example.LearningSpring.entity.ProductCategory;
import com.example.LearningSpring.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/category")
public class  ProductCategoryRestController {

    @Autowired
    private ProductCategoryService productCategoryService;

    @GetMapping("/")
    public List<ProductCategory> getAllProductCategory() {
        return productCategoryService.getAllProductCategory();
    }

    @PutMapping("/save")
    public ResponseEntity<ProductCategory> saveProductCategory(@RequestBody ProductCategory category) {
        productCategoryService.saveProductCategory(category);
        return new ResponseEntity<>(category, HttpStatus.CREATED);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteProductCategory(@PathVariable long id) {
        productCategoryService.deleteProductCategoryById(id);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity <ProductCategory>updateProductCategory(@RequestBody ProductCategory category,@PathVariable long id) {
        category = productCategoryService.updateProductCategory(category, id);
        return new ResponseEntity<>(category, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public  ProductCategory getProductById(@PathVariable("id") long id) {

        return  productCategoryService.findById(id);

    }
}
