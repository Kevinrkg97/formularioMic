class Usuario {
  int idUsuario;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String correo;
  String password;
  String cargo;

  Usuario(this.idUsuario, this.nombre, this.apellidoPaterno,
      this.apellidoMaterno, this.correo, this.cargo, this.password);

  Usuario.vacio();

  Usuario.fromJson(Map<String, dynamic> json)
      : idUsuario = json['id'],
        nombre = json['nombre'],
        apellidoPaterno = json['apellidoPaterno'],
        apellidoMaterno = json['apellidoMaterno'],
        correo = json['correo'],
        cargo = json['cargo'],
        password = json['password'];
/*
  Map<String, dynamic> toJson() =>
      {
        'id': idUsuario,
        'username': username,
        'password': password,
      };
*/
}
