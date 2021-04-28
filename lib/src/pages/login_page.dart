import 'package:flutter/material.dart';
import 'package:formulariomic/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Stack(
        children: <Widget>[
          _crearFondo( context ),
          _loginForm( context ),
        ],
      )
    );
  }
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
            boxShadow: <BoxShadow> [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 5.0),
                spreadRadius: 3.0
              )
            ]
          ),
          child: Column(
            children: <Widget>[
              Text('Inicio de sesión', style: TextStyle(fontSize: 20.0)),
              SizedBox( height: 60.0),
              _crearEmail(bloc),
              SizedBox(height: 30.0),
              _crearPassword(bloc),
              SizedBox(height: 30.0),
              _crearBoton(bloc),

            ],
          ),
        ),

        Text('¿Olvidaste tu contraseña?'),
        SizedBox( height:100.0)

      ],
    ),
  );
}



Widget _crearEmail(LoginBloc bloc) {

  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      
      return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),

    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon( Icons.alternate_email, color: Colors.deepOrange),
        hintText: 'ejemplo@correo.com',
        labelText: 'Correo electrónico',
        counterText: snapshot.data,
        errorText: snapshot.error
      ),
      onChanged: bloc.changeEmail,
    ),

  );
    },
  );
}


Widget _crearPassword(LoginBloc bloc) {

  return StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon( Icons.lock_outline, color: Colors.deepOrange),
            labelText: 'Contraseña',
            counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changePassword,
        ),
      );
    },
  );
}


Widget _crearBoton( LoginBloc bloc){

  // formValidStream
  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.deepOrange,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
      );
    },
  ); 
}

  _login( LoginBloc bloc, BuildContext context) {

    print(' ============');
    print('Email: ${ bloc.email }' );
    print('Password ${ bloc.password }');
    print(' ============');


    Navigator.pushReplacementNamed(context, 'home');
  }


Widget _crearFondo(BuildContext context) {
  
  final size = MediaQuery.of (context).size;

  final fondoNaranja = Container(
    height: size.height * 0.45,
    width:  double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: <Color> [
        Color.fromRGBO(240, 114, 34, 1.0),
        Color.fromRGBO(240, 114, 34, 1.0)
      ]
      )
    ),
  );

  return Stack(
    children: <Widget>[
      fondoNaranja,

  Container(
        padding: EdgeInsets.only(top: 80.0),
        child: Column(
          children: <Widget> [
            Icon ( Icons.account_circle, color: Colors.white, size: 100.0),
            SizedBox( height: 10.0, width: double.infinity),
            Text ('Microformas', style: TextStyle( color: Colors.white, fontSize: 25.0))
          ],
    ),
  )
  ],
  );

}
