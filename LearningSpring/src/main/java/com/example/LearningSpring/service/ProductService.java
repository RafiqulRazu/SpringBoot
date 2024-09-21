package com.example.LearningSpring.service;

import com.example.LearningSpring.entity.Product;
import com.example.LearningSpring.entity.ProductCategory;
import com.example.LearningSpring.repository.ProductCategoryRepository;
import com.example.LearningSpring.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ProductCategoryRepository productCategoryRepository;



    public List<Product> getAllProduct() {
        return productRepository.findAll();
    }

    public void saveProduct(Product product, MultipartFile imageFile) throws IOException {

        ProductCategory category = productCategoryRepository.findById(product.getCategory().getId())
                .orElseThrow(()->new RuntimeException("Product Category with this Id not found"));


        if(!imageFile.isEmpty() && imageFile !=null){
            String imageFilePath = saveImage(imageFile, product);
            product.setImage(imageFilePath);
        }
        product.setCategory(category);
        productRepository.save(product);
    }

    public Product findById(long id) {
        return productRepository.findById(id)
                .orElseThrow(()->new RuntimeException("Product with this Id not found"));
    }

    public void deleteProductById(long id) {
        productRepository.deleteById(id);
    }

    public List<Product> findProductByCategoryName(String categoryName) {
        return productRepository.findProductByCategoryName(categoryName);
    }

    public Product updateProduct(Product product, long id, MultipartFile file) throws IOException {
        Product existingProduct = this.productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product Not Found"));

        // Update product details
        existingProduct.setName(product.getName());
        existingProduct.setCategory(product.getCategory());
        existingProduct.setPrice(product.getPrice());
        existingProduct.setStock(product.getStock());


        // If a new image file is provided, save it
        if (file != null && !file.isEmpty()) {
            String imageFileName = this.saveImage(file, existingProduct);
            existingProduct.setImage(imageFileName);
        }

        // Save the updated product
        return this.productRepository.save(existingProduct);
    }


    @Value("src/main/resources/static/images")
    private String uploadDir;

    private String saveImage(MultipartFile file, Product product) throws IOException {
        Path uploadPath = Paths.get(uploadDir+"/product");
        if (!Files.exists(uploadPath)){
            Files.createDirectories(uploadPath);
        }

        String fileName = product.getName()+""+UUID.randomUUID().toString();
        Path path = uploadPath.resolve(fileName);

        Files.copy(file.getInputStream(), path);
        return fileName;
    }



}
