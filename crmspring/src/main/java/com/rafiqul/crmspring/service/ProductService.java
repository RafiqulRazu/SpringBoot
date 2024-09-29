package com.rafiqul.crmspring.service;

import com.rafiqul.crmspring.entity.Product;
import com.rafiqul.crmspring.repository.ProductRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    // Create a new product
    @Transactional
    public Product createProduct(Product product) {
        return productRepository.save(product);
    }

    // Get a product by its ID
    public Optional<Product> getProductById(Long id) {
        return productRepository.findById(id);
    }

    // Get all products
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    // Update an existing product
    @Transactional
    public Product updateProduct(Long id, Product productDetails) {
        Product existingProduct = productRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Product not found with id: " + id));

        // Update fields
        existingProduct.setName(productDetails.getName());
        existingProduct.setUnitPrice(productDetails.getUnitPrice());
        existingProduct.setStock(productDetails.getStock());
        existingProduct.setVat(productDetails.getVat());
        existingProduct.setStatus(productDetails.getStatus());

        return productRepository.save(existingProduct);
    }

    // Delete a product
    @Transactional
    public void deleteProduct(Long id) {
        Product existingProduct = productRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Product not found with id: " + id));

        productRepository.delete(existingProduct);
    }

}
