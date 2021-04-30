import 'package:flutter/material.dart';
import 'package:formulariomic/src/bloc/provider.dart';
import 'package:formulariomic/src/modelo/Usuario.dart';
import 'package:formulariomic/src/pages/camera_on.dart';
import 'package:formulariomic/src/pages/registry_of_colavolators.dart';

import 'fullscreenmap.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectDrawerItem = 0;
  Column(int pos) {
    switch (pos) {
      case 0:
        return FullScreenMap();
      case 1:
        return Camera_on();
      case 2:
        return Registry_of_colavorator();
    }
  }

  _onSelectItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    Usuario user = Usuario.fromJson(ModalRoute.of(context).settings.arguments);

    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido ${user.nombre}')),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                  '${user.nombre}  ${user.apellidoPaterno}  ${user.cargo}'),
              accountEmail: Text('Usuario: ${user.correo}'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.deepOrangeAccent,
                child: Text(
                  '${user.nombre.substring(0, 1)}',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text('Conocer ubicación'),
              leading: Icon(Icons.location_on_outlined),
              selected: (0 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Activar camara'),
              leading: Icon(Icons.camera_alt),
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text('Reguistrar nuevo usuario'),
              leading: Icon(Icons.account_circle),
              selected: (2 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(2);
              },
            ),
          ],
        ),
      ),
      body: Column(_selectDrawerItem),
    );
  }
}
