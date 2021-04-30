class Usuario {
  int idAdmin;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String telefono;
  String cargo;
  String correo;
  String password;

  Usuario({this.idAdmin, this.nombre, this.apellidoPaterno, this.apellidoMaterno, this.telefono, this.cargo, this.correo, this.password});

  Usuario.vacio();

  Usuario.login({this.correo, this.password});

  Usuario.fromJson(Map<String, dynamic> json)
      : idAdmin = json['idAdmin'],
        nombre = json['nombre'],
        apellidoPaterno = json['apellidoPaterno'],
        apellidoMaterno = json['apellidoMaterno'],
        telefono = json['telefono'],
        cargo = json['cargo'],
        correo = json['correo'],
        password = json['password'];


  Map<String, dynamic> toJson() =>
      {
        'idAdmin': idAdmin,
        'nombre': nombre,
        'apellidoPaterno': apellidoPaterno,
        'apellidoMaterno': apellidoMaterno,
        'telefono': telefono,
        'cargo': cargo,
        'correo': correo,
        'password': password,
      };

}
