package com.example.demo;

import com.example.demo.entity.Compte;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.ws.rs;
import javax.ws.rs.core.MediaType;
import java.util.List;
@RestController
@RequestMapping("/banque")
public class RestControllerAPI {
    @Autowired
    private CompteRepository compteRepository;

    @GetMapping(value = "/comptes", produces = {MediaType.APPLICATION_JSON})
    public List<Compte> listCompte(){
        return compteRepository.findAll();
    }
    @GetMapping(value = "/comptes/{id}", produces = {MediaType.APPLICATION_JSON})
    public Compte getcompte(@PathVariable Long id){
        return compteRepository.findById(id).get();
    }
    @PostMapping(value = "/comptes", produces = {MediaType.APPLICATION_JSON})
    public Compte ADD(@RequestBody Compte compte){
        return compteRepository.save(compte);
    }
    @PutMapping(value = "/comptes/{id}", produces = {MediaType.APPLICATION_JSON})
    public Compte update(@RequestBody Compte compte, @PathVariable Long id){
        compte.setId(id);
        return compteRepository.save(compte);
    }
    @DeleteMapping(value = "/comptes/{id}", produces =
            {MediaType.APPLICATION_JSON})
    public void delete(@PathVariable Long id){
        compteRepository.deleteById(id);
    }
}