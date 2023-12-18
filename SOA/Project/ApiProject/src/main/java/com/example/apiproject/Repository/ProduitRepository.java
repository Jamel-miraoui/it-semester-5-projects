package com.example.apiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.apiproject.Models.Produit;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ProduitRepository extends JpaRepository<Produit, Integer> {
    List<Produit> findByUserUserId(int userId);
}