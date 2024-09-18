package com.example.LearningSpring.service;

import com.example.LearningSpring.entity.Product;
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



    public List<Product> findAllProduct() {
        return productRepository.findAll();
    }

    public void saveProduct(Product product, MultipartFile imageFile) throws IOException {

        if(!imageFile.isEmpty() && imageFile !=null){
            String imageFilePath = saveImage(imageFile, product);
            product.setImage(imageFilePath);
        }
        productRepository.save(product);
    }

    public Product findProductById(int id) {
        return productRepository.findById(id).get();
    }

    public void deleteProductById(int id) {
        productRepository.deleteById(id);
    }

    @Value("src/main/resources/static/image")
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
