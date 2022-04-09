import 'package:fixapp/objects/obj_image.dart';
import 'package:fixapp/objects/obj_video.dart';
import 'package:fixapp/widget/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

import 'package:video_player/video_player.dart';

class Show_Video {
  Show_Video({required this.obj,required this.controller});
  final VideoPlayerController controller;
  final Obj_Video obj;

  void show(BuildContext context){
    controller.initialize().then((_) {
      controller.play();
    }).then((value) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  constraints: const BoxConstraints(
                      minWidth: double.infinity, minHeight: 250),
                  child:  VideoPlayerWidget(controller: controller),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,0,8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){
                          controller.play();
                        }, icon: Icon(Icons.play_arrow),
                        iconSize: 40,),
                        IconButton(onPressed: (){
                          controller.pause();
                        }, icon: Icon(Icons.pause),
                          iconSize: 40,),
                      ],
                    )
                  ),
                ),
                Text('el video dura: ' +
                    controller.value.duration.inSeconds.toString() +
                    ' segundos.'),
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
                          controller.pause();
                          controller.dispose();
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
        }));
  }
}