package com.example.demo.serviceInterface;

import java.util.Optional;

import com.example.demo.modelEntity.Usuario;

public interface UsuarioServiceInterface {
	
	Optional<Usuario> findByCorreoAndPassword(Usuario usuario);

}
