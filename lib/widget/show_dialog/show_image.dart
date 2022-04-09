import 'package:fixapp/objects/obj_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class Show_Image {
  Show_Image({required this.obj});

  final Obj_Image obj;

  void show(BuildContext context){
    io.File file = io.File(obj.image.path);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  constraints:
                  const BoxConstraints(minWidth: double.infinity, minHeight: 250),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(file), fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,0,8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('De: ' + obj.author,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,0,8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Fecha: ' + obj.time.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,0,8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Expediente: ' + obj.file,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
                      ),),
                  ),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "ACEPTAR",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }
}