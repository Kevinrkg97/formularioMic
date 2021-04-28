package com.example.demo.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelEntity.Usuario;

@Repository
public interface UsuarioRepository extends CrudRepository<Usuario, Long>{

	Optional<Usuario> findByCorreoAndPassword(String correo, String password);
}
