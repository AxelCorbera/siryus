import 'dart:convert';

import 'package:fixapp/services/location_service.dart';
import 'package:http/http.dart' as http;

class Request {
  Future<LocationService> buscarUbicacion(String lugar) async {
    LocationService locationService;
    String parametros = 'query=' + lugar.replaceAll(' ', '%20');

    parametros = parametros + "&key=AIzaSyDA4klOY0njuyOUY5r-EvI1LiCKzdC5ZlA";
    //print(parametros);
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse('https://maps.googleapis.com/maps/api/place/textsearch/json?$parametros'),
      );
      //print(json.decode(response.body));
      locationService = LocationService.fromJson(json.decode(response.body));
    } finally {
      client.close();
    }
    return locationService;
  }
}
