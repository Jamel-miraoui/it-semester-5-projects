package com.example.apiproject.Service;

import com.example.apiproject.Models.Produit;
import com.example.apiproject.Repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProduitService {
    @Autowired
    private ProduitRepository produitRepository;

    public Produit addProduit(Produit produit) {
        // Implement logic to add a produit to the database
        return produitRepository.save(produit);
    }

    public Produit updateProduit(int reference, Produit updatedProduit) {
        // Implement logic to update a produit in the database
        Produit existingProduit = produitRepository.findById(reference)
                .orElseThrow(() -> new RuntimeException("Produit not found with reference: " + reference));

        existingProduit.setName(updatedProduit.getName());
        existingProduit.setPrix(updatedProduit.getPrix());
        existingProduit.setImagePath(updatedProduit.getImagePath());

        return produitRepository.save(existingProduit);
    }

    public void deleteProduit(int reference) {
        // Implement logic to delete a produit from the database
        produitRepository.deleteById(reference);
    }
}
