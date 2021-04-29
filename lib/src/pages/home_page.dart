import 'package:flutter/material.dart';
import 'package:formulariomic/src/bloc/provider.dart';
import 'package:formulariomic/src/pages/camera_on.dart';
import 'package:formulariomic/src/pages/users_location.dart';

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

    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido ${bloc.email}')),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Aqui se colocara el nombre del usuario'),
              accountEmail: Text('Usuario: ${bloc.email}'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.deepOrangeAccent,
                child: Text(
                  'E',
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
            )
          ],
        ),
      ),
      body: Column(_selectDrawerItem),
    );
  }
}
