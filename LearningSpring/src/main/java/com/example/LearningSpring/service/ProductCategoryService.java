package com.example.LearningSpring.service;

import com.example.LearningSpring.entity.ProductCategory;
import com.example.LearningSpring.repository.ProductCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductCategoryService {

    @Autowired
    private ProductCategoryRepository productCategoryRepository;

    public void saveProductCategory(ProductCategory category) {

        productCategoryRepository.save(category);
    }

    public List<ProductCategory> getAllProductCategory() {

        return productCategoryRepository.findAll();
    }

    public void deleteProductCategoryById(long id) {

        productCategoryRepository.deleteById(id);
    }

    public ProductCategory findById(long id) {

        return productCategoryRepository.findById(id).get();
    }

    public ProductCategory updateProductCategory(ProductCategory category, long id) {

        return productCategoryRepository.save(category);
    }

}
