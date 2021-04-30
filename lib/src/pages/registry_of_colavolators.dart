import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formulariomic/src/modelo/Usuario.dart';
import 'package:http/http.dart' as http;

class Registry_of_colavorator extends StatefulWidget {
  @override
  _Registry_of_colavoratorState createState() =>
      _Registry_of_colavoratorState();
}

class _Registry_of_colavoratorState extends State<Registry_of_colavorator> {

  final formKey = GlobalKey<FormState>();
  Usuario empleado = Usuario.vacio();
  String mensajeValidacion = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              _titulo(),
              SizedBox(
                height: 10,
              ),
              _nom_usuario(),
              _ap_usuario(),
              _am_usuario(),
              _num_usuario(),
              _puest_usuario(),
              _corr_usuario(),
              _pass_usuario(),
              Text(mensajeValidacion),
              _boton_registro(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titulo() {
    return Center(
      child: Text(
        'Registrar nuevo usuario',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.orange[900],
        ),
      ),
    );
  }

  Widget _nom_usuario() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: (value) => validar(value),
        onSaved: (value){empleado.nombre = value;},
        decoration: InputDecoration(
          labelText: "Nombre",
          icon: Icon(Icons.account_circle),
          hintText: "Nombre",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _ap_usuario() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: (value) => validar(value),
        onSaved: (value){empleado.apellidoPaterno = value;},
        decoration: InputDecoration(
          labelText: "Primer apellido",
          icon: Icon(Icons.account_circle),
          hintText: "Apellido",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _am_usuario() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        onSaved: (value){empleado.apellidoMaterno = value;},
        decoration: InputDecoration(
          labelText: "Segundo apellido",
          icon: Icon(Icons.account_circle),
          hintText: "Apellido",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _num_usuario() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        onSaved: (value){empleado.telefono = value;},
        decoration: InputDecoration(
          labelText: "Numero telefonico",
          icon: Icon(Icons.phone),
          hintText: "Numero de tefelono",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _puest_usuario() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        onSaved: (value){empleado.cargo = value;},
        validator: (value) => validar(value),
        decoration: InputDecoration(
          labelText: "Puesto",
          icon: Icon(Icons.verified_user),
          hintText: "Puesto",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _corr_usuario() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        onSaved: (value){empleado.correo = value;},
        validator: (value) => validar(value),
        decoration: InputDecoration(
          labelText: "Correo electronico",
          icon: Icon(Icons.alternate_email),
          hintText: "Correo",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _pass_usuario() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: (value) => validar(value),
        onSaved: (value){empleado.password = value;},
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Contraseña",
          icon: Icon(Icons.lock_outline),
          hintText: "Contraseña",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _boton_registro() {
    return Container(
      padding: EdgeInsets.all(25),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        color: Colors.orange,
        child: Text(
          'Registrar usuario',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: () {
          registrar();
        },
      ),
    );
  }


  Future registrar() async{
    if(formKey.currentState.validate()){
      formKey.currentState.save();


      final String url = "http://192.168.10.101:8080/empelado/create";
      int status;
      Map<String, dynamic> datos;


      try{
        var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode(empleado.toJson()) ).timeout(const Duration(seconds: 20));
        status = response.statusCode;
        datos = json.decode(response.body);

        if(status == 201){
          //Navigator.pushReplacementNamed(context, "/codigoVerificacion", arguments: Usuario.fromJson(datos));
          setState(() {
            mensajeValidacion = datos['success'];
          });
          return;
        }

        String mensaje;
        if(status == 404) mensaje = datos['mensajeAplication'];

        if(status == 500) mensaje = datos['mensajeAplication'];

        setState(() {
          mensajeValidacion = mensaje;
          loading = false;
        });

      }on SocketException{
        setState(() {
          mensajeValidacion = "Error de conexión.";
          loading = false;
        });
      }

    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}





String validar(String value){
  if(value.isEmpty){
    return "*Campo requerido.";
  }
  return null;
}