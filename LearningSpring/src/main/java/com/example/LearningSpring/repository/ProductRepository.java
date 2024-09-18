package com.example.LearningSpring.repository;

import com.example.LearningSpring.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query("SELECT p FROM Product p WHERE p.category.name=:categoryName ")
    List<Product> findProductByCategoryName(@Param("categoryName") String categoryName);

}