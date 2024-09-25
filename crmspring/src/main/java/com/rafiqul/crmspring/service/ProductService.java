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


//    @Transactional
//    public Product createProduct(Product product) {
//        return productRepository.save(product);
//    }

    @Transactional
    public Product createProduct(Product product) {
        // Ensure agentAmount is less than mrp
        if (product.getAgentAmount() >= product.getMrp()) {
            throw new IllegalArgumentException("Agent amount must be less than MRP.");
        }
        return productRepository.save(product);
    }

    public Optional<Product> getProductById(Long id) {
        return productRepository.findById(id);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

//

    @Transactional
    public Product updateProduct(Long id, Product productDetails) {
        Product existingProduct = productRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Product not found with id: " + id));

        // Ensure agentAmount is less than mrp
        if (productDetails.getAgentAmount() >= productDetails.getMrp()) {
            throw new IllegalArgumentException("Agent amount must be less than MRP.");
        }

        // Update the product fields
        existingProduct.setName(productDetails.getName());
        existingProduct.setAgentAmount(productDetails.getAgentAmount());
        existingProduct.setMrp(productDetails.getMrp());
        existingProduct.setUnit(productDetails.getUnit());
        existingProduct.setVat(productDetails.getVat());
        existingProduct.setStatus(productDetails.getStatus());

        return productRepository.save(existingProduct);
    }

    @Transactional
    public void deleteProduct(Long id) {
        Product existingProduct = productRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Product not found with id: " + id));

        productRepository.delete(existingProduct);
    }

}
