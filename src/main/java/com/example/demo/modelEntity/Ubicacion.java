package com.example.demo.modelEntity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ubicaciones")
public class Ubicacion implements Serializable{
	
	@Id
	@Column(name = "id_ubicacion")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idUbicacion;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_usuario")
	private Usuario usuario ;
	
	private String latitud;
	
	private String longitud;

	public Ubicacion() {
		
	}

	public Ubicacion(Long idUbicacion, Usuario usuario, String latitud, String longitud) {
		this.idUbicacion = idUbicacion;
		this.usuario = usuario;
		this.latitud = latitud;
		this.longitud = longitud;
	}

	public Long getIdUbicacion() {
		return idUbicacion;
	}

	public void setIdUbicacion(Long idUbicacion) {
		this.idUbicacion = idUbicacion;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getLatitud() {
		return latitud;
	}

	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}

	public String getLongitud() {
		return longitud;
	}

	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}
	
	private static final long serialVersionUID = 1L;
	
}
