import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formulariomic/src/bloc/provider.dart';
import 'package:formulariomic/src/modelo/Usuario.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String mensajeCredenciales = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Inicio de sesión', style: TextStyle(fontSize: 20.0)),
                //mensajeCredenciales
                SizedBox(height: 40.0),
                Text(mensajeCredenciales, style: TextStyle(color: Colors.redAccent),),
                SizedBox(height: 15.0),
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                _crearPassword(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc),
              ],
            ),
          ),
          Text('¿Olvidaste tu contraseña?'),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Future _login(LoginBloc bloc, BuildContext context) async {
    final String url = "http://192.168.10.101:8080/login";
    String exception = null;

    Usuario user = Usuario.login(correo: bloc.email, password: bloc.password);
    try {
      var response = await http.post(url, headers: {"Content-Type": "application/json"},body: json.encode(user.toJson())).timeout(const Duration(seconds: 20));

      print("este es el mensaje:  ${response.request}");

      if (response.body.isEmpty) {
          setState(() {
            mensajeCredenciales = "Las credenciales son incorrectas.";
          });
          return;
      }

      //se encontro alusuario y datos correctos pasa a la siguiente pagina.
      Navigator.pushReplacementNamed(context, 'home', /*arguments: json.decode(response.body)*/);

    }on SocketException {
      exception = "Falló la conexión.";
    }

    setState(() {
      mensajeCredenciales = exception;
    });

  }




  Widget _crearBoton(LoginBloc bloc) {
    // formValidStream
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return MaterialButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Ingresar'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Colors.deepOrange,
            textColor: Colors.white,
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null);
      },
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email, color: Colors.deepOrange),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electrónico',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.deepOrange),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }



  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoNaranja = Container(
      height: size.height * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(240, 114, 34, 1.0),
        Color.fromRGBO(240, 114, 34, 1.0)
      ])),
    );

    return Stack(
      children: <Widget>[
        fondoNaranja,
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.account_circle, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('Microformas',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }
}
