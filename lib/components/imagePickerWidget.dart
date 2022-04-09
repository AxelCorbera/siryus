import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef OnImageSelected = Function(XFile imageFile);

class ImagePickerWidget{
  final Function mostrarFoto;
  final Function mostrarVideo;
  late XFile imageFile;
  late OnImageSelected onImageSelected;
  ImagePickerWidget({required this.mostrarFoto, required this.mostrarVideo});
  File file = File('');

  void ShowPickImage(BuildContext context, source) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: source);
    if (image != null) mostrarFoto(context, image);
  }

  void ShowPickVideo(BuildContext context, source) async {
    final ImagePicker _picker = ImagePicker();
    XFile? video = await _picker.pickVideo(source: source);
    if (video != null) mostrarVideo(context, video);
  }
}
