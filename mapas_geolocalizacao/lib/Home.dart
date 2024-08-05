import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  Set<Marker> _marcadores = {};
  Set<Polygon> _poligonos = {};
  Set<Circle> _circulos = {};


  _movimentarCamera() async{
    var googleMapController =  await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(-23.282392,-45.899443),
              zoom: 15,
            tilt: 45, //angulação da camera
            bearing: 20 //Rotação
          )
      )
    );
  }



  _CarregarMarcadores(){
    //-23.242481214624842, -45.90511863490137
    Marker marcadorShopping = Marker(
        markerId: MarkerId("identificador"),
      position: LatLng(
          -23.2652163761331, -45.900088944777956
      ),
      infoWindow: InfoWindow(
        title: "teste marcador"
      )
    );

    Polygon poligon = Polygon(
        polygonId: PolygonId("id"),
      fillColor: Colors.green,
      points: [
        LatLng(-23.259607593589212, -45.909797977546596),
        LatLng(-23.260565863769987, -45.90616250197443),
        LatLng(-23.26139387808669, -45.91000051100465)
      ]
    );

    Circle circulo = Circle(
        circleId: CircleId("id"),
      center: LatLng(-23.258091093691874, -45.90824859659244),
      radius: 200,
      fillColor: Colors.red.withOpacity(0.2),
      strokeWidth: 2,
      
    );

    setState(() {
      _circulos.add(circulo);
      _marcadores.add(marcadorShopping);
      _poligonos.add(poligon);
    });


  }

  @override
  void initState() {
    super.initState();

    _CarregarMarcadores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapas"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: (){
          _movimentarCamera();
        },
      ),
      body: Container(
        child: GoogleMap(
          //-23.242392, -45.899443
          initialCameraPosition: CameraPosition(
            target: LatLng(-23.2652163761331, -45.900088944777956),
            zoom: 15
          ),
          onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);


            },
          markers: _marcadores,
          polygons: _poligonos,
          circles: _circulos,
          mapType: MapType.normal,
        ),
      ),
    );
  }
}
