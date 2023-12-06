package com.example.demo;

import com.example.demo.entity.Compte;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

public interface CompteRepository extends JpaRepository<Compte,Long> {
}