import 'package:fixapp/components/imagePickerWidget.dart';
import 'package:fixapp/objects/obj_image.dart';
import 'package:fixapp/widget/show_dialog/show_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class Images extends StatelessWidget{
  Images({required this.imagenes, required this.mostrarFoto, required this.mostrarVideo});
  final Function mostrarFoto;
  final Function mostrarVideo;
  final List<Obj_Image> imagenes;
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'IMÁGENES SINIESTROS',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Divider(),
        imagenes.isEmpty
            ? Text(
          'No hay imagenes disponibles',
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
              itemCount: imagenes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Show_Image show_image = Show_Image(obj: imagenes[index]);
                      show_image.show(context);
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(
                                io.File((imagenes[index].image.path))),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                );
              }),
        ),
        RaisedButton(
          onPressed: () {
            ImagePickerWidget picker = ImagePickerWidget(mostrarFoto: mostrarFoto,mostrarVideo: mostrarVideo);
            picker.ShowPickImage(context, ImageSource.gallery);
          },
          child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              alignment: Alignment.center,
              child: Text('AÑADIR IMAGEN DESDE GALERIA')),
        ),
        // RaisedButton(
        //   onPressed: imagenes.isEmpty ? null : () {},
        //   child: Container(
        //       width: MediaQuery.of(context).size.width / 1.1,
        //       alignment: Alignment.center,
        //       child: Text('IMAGENES TODOS LOS OFICIOS')),
        // ),
      ],
    );
  }
}