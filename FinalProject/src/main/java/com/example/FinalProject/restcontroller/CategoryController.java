package com.example.FinalProject.restcontroller;

import com.example.FinalProject.entity.Category;
import com.example.FinalProject.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@RestController
@RequestMapping("/api/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;



    @GetMapping("/")
    public List<Category> getAllCategory() {
        return categoryService.getAllCategory();
    }

    @PostMapping("/save")
    public ResponseEntity<Category> saveCategory(@RequestBody Category category) {
        categoryService.saveCategory(category);
        return new ResponseEntity<>(category, HttpStatus.CREATED);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteById(@PathVariable long id) {
        categoryService.deleteCategory(id);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity <Category>updateCategory(@RequestBody Category c, @PathVariable long id) {
        Category category= categoryService.updateCategory(c,id);
        return new ResponseEntity<>(category, HttpStatus.OK);
    }
}
