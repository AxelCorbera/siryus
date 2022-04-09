import 'package:image_picker/image_picker.dart';

class Obj_Image{
  final XFile image;
  final DateTime time;
  final String author;
  final String file;

  Obj_Image({required this.image,
  required this.time,
  required this.author,
  required this.file});
}