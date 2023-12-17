package com.example.apiproject.Controllers;

import com.example.apiproject.Models.Produit;
import com.example.apiproject.Service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/produits")
public class ProduitController {
    @Autowired
    private ProduitService produitService;

    @PostMapping
    public ResponseEntity<Produit> addProduit(@RequestBody Produit produit) {
        Produit addedProduit = produitService.addProduit(produit);
        return ResponseEntity.ok(addedProduit);
    }

    @PutMapping("/{reference}")
    public ResponseEntity<Produit> updateProduit(@PathVariable int reference, @RequestBody Produit updatedProduit) {
        Produit updated = produitService.updateProduit(reference, updatedProduit);
        return ResponseEntity.ok(updated);
    }
    @DeleteMapping("/{reference}")
    public ResponseEntity<String> deleteProduit(@PathVariable int reference) {
        produitService.deleteProduit(reference);
        return ResponseEntity.ok("Produit with reference " + reference + " deleted successfully.");
    }
}
