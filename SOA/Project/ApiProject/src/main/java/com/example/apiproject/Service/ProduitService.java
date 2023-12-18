package com.example.apiproject.Service;

import com.example.apiproject.Models.Produit;
import com.example.apiproject.Repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProduitService {
    @Autowired
    private ProduitRepository produitRepository;

    public Produit addProduit(Produit produit) {
        return produitRepository.save(produit);
    }

    public Produit updateProduit(int reference, Produit updatedProduit) {
        Produit existingProduit = produitRepository.findById(reference)
                .orElseThrow(() -> new RuntimeException("Produit not found with reference: " + reference));

        existingProduit.setName(updatedProduit.getName());
        existingProduit.setPrix(updatedProduit.getPrix());
        existingProduit.setImagePath(updatedProduit.getImagePath());

        return produitRepository.save(existingProduit);
    }

    public void deleteProduit(int reference) {
        produitRepository.deleteById(reference);
    }

    public List<Produit> getAllProduits() {
        return produitRepository.findAll();
    }
    public List<Produit> getProduitsByUserId(int userId) {
        return produitRepository.findByUserUserId(userId);
    }

    public Produit getProduitById(int id) {
        return produitRepository.getReferenceById(id) ;
    }
}
