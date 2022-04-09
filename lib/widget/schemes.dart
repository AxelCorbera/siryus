import 'dart:typed_data';

import 'package:fixapp/objects/obj_image.dart';
import 'package:fixapp/objects/obj_scheme.dart';
import 'package:fixapp/widget/show_dialog/show_image.dart';
import 'package:fixapp/widget/show_dialog/show_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class Schemes extends StatelessWidget{
  Schemes({required this.schemes});
  final List<Obj_Scheme> schemes;
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ESQUEMAS',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Divider(),
        schemes.isEmpty
            ? Text(
          'No hay esquemas disponibles',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
          ),
        )
            : Container(
          height: 150,
          child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: schemes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Show_Scheme show_scheme = Show_Scheme(obj: schemes[index]);
                      show_scheme.show(context);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: FutureBuilder<Uint8List>(
                          future: schemes[index].image.toPNG(),
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
                                    child: CircularProgressIndicator());
                            }
                          },
                        )),
                  ),
                );
              }),
        ),
        // RaisedButton(
        //   onPressed: () {},
        //   child: Container(
        //       width: MediaQuery.of(context).size.width / 1.1,
        //       alignment: Alignment.center,
        //       child: Text('AÑADIR IMAGEN DESDE GALERIA')),
        // ),
        // RaisedButton(
        //   onPressed: schemes.isEmpty ? null : () {},
        //   child: Container(
        //       width: MediaQuery.of(context).size.width / 1.1,
        //       alignment: Alignment.center,
        //       child: Text('IMAGENES TODOS LOS OFICIOS')),
        // ),
      ],
    );
  }
}