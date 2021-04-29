import 'package:flutter/material.dart';
import 'package:formulariomic/src/bloc/provider.dart';
import 'package:formulariomic/src/pages/home_page.dart';

import 'home_page.dart';

class Users_Location extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ubicaciones'),
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido ${bloc.email}')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Email: ${bloc.email}'),
          Divider(),
          Text('Password: ${bloc.password}')
        ],
      ),
    );
  }
}
