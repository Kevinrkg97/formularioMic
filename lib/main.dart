import 'package:flutter/material.dart';
import 'package:formulariomic/src/bloc/provider.dart';
import 'package:formulariomic/src/pages/home_page.dart';
import 'package:formulariomic/src/pages/login_page.dart';
import 'package:formulariomic/src/pages/fullscreenmap.dart';

import 'src/pages/registry_of_admin.dart';
import 'src/pages/registry_of_colavolators.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Microformas',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'map': (BuildContext context) => FullScreenMap(),
          'reg_usu': (BuildContext context) => Registry_of_colavorator(),
          'reg_admin': (BuildContext context) => Registry_of_admin(),
        },
        theme: ThemeData(primaryColor: Colors.deepOrange),
      ),
    );
  }
}
