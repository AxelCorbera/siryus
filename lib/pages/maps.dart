import 'dart:async';
import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/http/requests.dart';
import 'package:fixapp/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  Maps({required this.lugar});
  final CameraPosition lugar;
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.background,
        title: Text("Map"),
      ),
      body: GoogleMap(
      mapType: MapType.normal,
    initialCameraPosition: widget.lugar,
    onMapCreated: (GoogleMapController controller) {
    _controller.complete(controller);
    },
        markers: {Marker(markerId: MarkerId(''),
        position: LatLng(widget.lugar.target.latitude,
      widget.lugar.target.longitude))},
    ),
    );
  }

}
