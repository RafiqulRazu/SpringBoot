package com.example.FinalProject.service;

import com.example.FinalProject.entity.Category;
import com.example.FinalProject.entity.Product;
import com.example.FinalProject.repository.CategoryRepository;
import com.example.FinalProject.repository.ProductRepository;
import com.example.FinalProject.util.ApiResponse;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoryRepository categoryRepository;


    public List<Product> getAllProduct() {
        return productRepository.findAll();
    }

    @Transactional
    public ApiResponse saveProduct(Product product, MultipartFile imageFile) throws IOException {
        ApiResponse apiResponse = new ApiResponse();

        try {
            Category category = categoryRepository.findById(product.getCategory().getId())
                    .orElseThrow(() -> new RuntimeException("Product with this id not found"));

            if (imageFile != null && !imageFile.isEmpty()) {
                String imageFileName = saveImage(imageFile, product);
                product.setImage(imageFileName);
            }
            productRepository.save(product);
            apiResponse.setSuccessful(true);
            apiResponse.setMessage("Product saved successfully");
            return apiResponse;
        } catch (Exception e) {
            apiResponse.setMessage(e.getMessage());
            return apiResponse;
        }
    }

//    public ApiResponse getAllProduct() {
//        ApiResponse apiResponse = new ApiResponse();
//        try {
//            List<Product> products = productRepository.findAll();
//
//            Map<String, Object> map = new HashMap<>();
//            map.put("products", products);
//
//            apiResponse.setData(map);
//            apiResponse.setSuccessful(true);
//            apiResponse.setMessage("All products found");
//            return apiResponse;
//        } catch (Exception e) {
//            apiResponse.setMessage(e.getMessage());
//            return apiResponse;
//        }
//    }

    public void deleteProductById(long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(long id){
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product with this Id not found"));
    }


    @Transactional
    public Product updateProduct(Product product, long id, MultipartFile file) throws IOException {
        Product existingProduct = this.productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product Not Found"));

        // Update product details
        existingProduct.setName(product.getName());
        existingProduct.setCategory(product.getCategory());
        existingProduct.setPrice(product.getPrice());
        existingProduct.setQuantity(product.getQuantity());

        // If a new image file is provided, save it
        if (file != null && !file.isEmpty()) {
            String imageFileName = this.saveImage(file, existingProduct);
            existingProduct.setImage(imageFileName);
        }
        // Save the updated product
        return this.productRepository.save(existingProduct);
    }


    @Value("src/main/resources/static/image")
    private String uploadDir;

    private String saveImage(MultipartFile file, Product product) throws IOException {
        Path uploadPath = Paths.get(uploadDir+"/product");
        if (!Files.exists(uploadPath)){
            Files.createDirectories(uploadPath);
        }

        String fileName = product.getName()+""+ UUID.randomUUID().toString();
        Path path = uploadPath.resolve(fileName);

        Files.copy(file.getInputStream(), path);
        return fileName;
    }
}
