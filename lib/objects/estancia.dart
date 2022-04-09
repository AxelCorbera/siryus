import 'package:camera/camera.dart';

class Estancia{
  int? id;
  String estancia;
  String largo;
  String ancho;
  Oficio? oficio;

  Estancia({
    required this.estancia,
    required this.ancho,
    required this.largo});
}

class Oficio{
  String oficio;
  Averia averia;
  Oficio({
    required this.oficio,
    required this.averia
});
}

class Averia{
  String averia;
  String medida;
  XFile foto;
  Averia({
    required this.averia,
    required this.medida,
    required this.foto
});
}