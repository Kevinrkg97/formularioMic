package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelEntity.Usuario;
import com.example.demo.serviceInterface.UsuarioServiceInterface;

@RestController
public class UsuarioController {
	
	@Autowired
	UsuarioServiceInterface usuarioS;
	
	@PostMapping(path = "/login")
	public Usuario login(@RequestBody Usuario usuario){
		Optional<Usuario> userBuscado = usuarioS.findByCorreoAndPassword(usuario);
		
		if (!userBuscado.isEmpty()) {
			usuario = userBuscado.get();
			usuario.setPassword(null);
			return usuario;
		}	
		return null;
	}

}
