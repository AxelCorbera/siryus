import 'dart:typed_data';
import 'package:fixapp/objects/obj_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Show_Scheme {
  Show_Scheme({required this.obj});

  final Obj_Scheme obj;

  void show(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: FutureBuilder<Uint8List>(
                      future: obj.image.toPNG(),
                      builder:
                          (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Image.memory(snapshot.data!);
                            }
                          default:
                            return Container(
                                child: const FractionallySizedBox(
                                  widthFactor: 0.1,
                                  child: AspectRatio(
                                      aspectRatio: 1.0,
                                      child: CircularProgressIndicator()),
                                  alignment: Alignment.center,
                                ));
                        }
                      },
                    )),
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