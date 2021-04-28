package com.example.demo.serviceImplements;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.modelEntity.Usuario;
import com.example.demo.repository.UsuarioRepository;
import com.example.demo.serviceInterface.UsuarioServiceInterface;

@Service
public class UsuarioServiceImplements implements UsuarioServiceInterface{

	@Autowired
	UsuarioRepository usuarioR;
	
	@Override
	public Optional<Usuario> findByCorreoAndPassword(Usuario usuario) {
		return usuarioR.findByCorreoAndPassword(usuario.getCorreo(), usuario.getPassword());
	}

	
}
