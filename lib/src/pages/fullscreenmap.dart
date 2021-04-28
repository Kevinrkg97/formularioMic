import 'package:flutter/material.dart';
import 'package:formulariomic/src/bloc/provider.dart';
import 'package:mapbox_gl/mapbox_gl.dart';



class FullScreenMap extends StatefulWidget {

  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}
  
class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${ bloc.email }')
      ), 
      body: MapboxMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
        const CameraPosition(
        target: LatLng(19.4013281,-99.0681676),
        zoom: 14
        ),
      )
    );
  }
}