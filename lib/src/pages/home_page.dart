import 'package:flutter/material.dart';
import 'package:formulariomic/src/bloc/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold (
      appBar: AppBar(
        title: Text('Bienvenido ${ bloc.email }')
      ), 
       body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email: ${ bloc.email }'),
            Divider(),
            Text('Password: ${ bloc.password }')
          ],
        ),
    
    );
  }
}