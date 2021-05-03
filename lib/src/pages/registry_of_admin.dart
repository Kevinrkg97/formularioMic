import 'package:flutter/material.dart';

class Registry_of_admin extends StatefulWidget {
  @override
  _Registry_of_admin createState() => _Registry_of_admin();
}

class _Registry_of_admin extends State<Registry_of_admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              SizedBox(height: 25.0),
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
        'Registrar nuevo Administrador',
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
      child: TextField(
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
      child: TextField(
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
      child: TextField(
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
      child: TextField(
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
      child: TextField(
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
      child: TextField(
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
      child: TextField(
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
        onPressed: () {},
      ),
    );
  }
}
