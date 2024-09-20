package com.example.FinalProject.service;

import com.example.FinalProject.entity.Category;
import com.example.FinalProject.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;


    public void saveCategory(Category category) {

        categoryRepository.save(category);
    }

    public List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }

    public void deleteCategory(long id) {
        categoryRepository.deleteById(id);
    }

    public Category findCategoryById(long id) {
        return categoryRepository.findById(id).get();
    }

    public Category updateCategory(Category category, long id) {
        return categoryRepository.save(category);
    }

}
