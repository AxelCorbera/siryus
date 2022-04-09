import 'package:camera/camera.dart';

class Obj_Video{
  final XFile video;
  final DateTime time;
  final String author;
  final String file;

  Obj_Video({required this.video,
    required this.time,
    required this.author,
    required this.file});
}