package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
    @Bean
    DemoApplication start(com.example.DemoApplication.repository.CompteRepository
                                    compteRepository){
        return args -> {
            compteRepository.save(new
                    com.example.DemoApplication.entity.Compte(null, Math.random()*9000,new Date(),
                    TypeCompte.Courant));
            compteRepository.save(new
                    com.example.DemoApplication.entity.Compte(null, Math.random()*9000,new Date(),
                    com.example.DemoApplication.entity.TypeCompte.Epargne));
            compteRepository.save(new
                    com.example.DemoApplication.entity.Compte(null, Math.random()*9000,new Date(),
                    com.example.DemoApplication.entity.TypeCompte.Epargne));
            compteRepository.save(new
                    com.example.DemoApplication.entity.Compte(null, Math.random()*9000,new Date(),
                    com.example.DemoApplication.entity.TypeCompte.Courant));
            compteRepository.findAll().forEach(c->{
                System.out.print(c.toString());
            });
        };
    }
}
