import 'package:fixapp/components/imagePickerWidget.dart';
import 'package:fixapp/objects/obj_video.dart';
import 'package:fixapp/widget/show_dialog/show_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

import 'package:video_player/video_player.dart';

class Videos extends StatelessWidget{
  Videos({required this.videos, required this.mostrarFoto, required this.mostrarVideo});
  final Function mostrarFoto;
  final Function mostrarVideo;
  final List<Obj_Video> videos;
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VIDEOS SINIESTROS',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Divider(),
        if (videos.isEmpty)
          Text(
            'No hay videos disponibles',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
            ),
          )
        else
          Container(
            height: 150,
            child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: videos.length,
                itemBuilder: (context, index) {

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    RaisedButton(
                      child: Icon(Icons.slow_motion_video_outlined,
                      size: 50,),
                      onPressed: (){
                        io.File file = io.File(videos[index].video.path);
                        VideoPlayerController controller = VideoPlayerController.file(file);
                        Show_Video show_video = Show_Video(obj: videos[index],controller: controller);
                        show_video.show(context);
                      },
                    ),
                  );
                }),
          ),
        RaisedButton(
          onPressed: () {
            ImagePickerWidget picker = ImagePickerWidget(mostrarFoto: mostrarFoto,mostrarVideo: mostrarVideo);
            picker.ShowPickVideo(context, ImageSource.gallery);
          },
          child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              alignment: Alignment.center,
              child: Text('AÑADIR VIDEO DESDE GALERIA')),
        ),
        // RaisedButton(
        //   onPressed: null,
        //   child: Container(
        //       width: MediaQuery.of(context).size.width / 1.1,
        //       alignment: Alignment.center,
        //       child: Text('VIDEOS TODOS LOS OFICIOS')),
        // ),
      ],
    );
  }
}