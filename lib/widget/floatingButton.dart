import 'package:fixapp/components/camera_video.dart';
import 'package:fixapp/components/imagePickerWidget.dart';
import 'package:fixapp/functions/message_snack.dart';
import 'package:fixapp/pages/add_comment.dart';
import 'package:fixapp/pages/add_settlement.dart';
import 'package:fixapp/pages/first_visit.dart';
import 'package:fixapp/pages/scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fixapp/objects/file.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';

class FloatingButton extends StatelessWidget{
  FloatingButton({required this.MostrarVideo,
    required this.MostrarFoto,
    required this.MostrarEsquema,
  required this.expediente});
  final Function MostrarVideo;
  final Function MostrarFoto;
  final Function MostrarEsquema;
  final File expediente;

  Widget build(BuildContext context){
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      spacing: 7,
      spaceBetweenChildren: 3,
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.done,
            color: Colors.white,
          ),
          label: 'Añadir firma',
          backgroundColor: Colors.grey[700],
          onTap: null,
        ),
        SpeedDialChild(
          child: Icon(
            Icons.create_new_folder,
            color: Colors.white,
          ),
          label: 'Añadir partida exped.',
          backgroundColor: Colors.grey[700],
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Add_Settlement(expediente: expediente,)));
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.crop,
            color: Colors.white,
          ),
          label: 'Añadir esquema',
          backgroundColor: Colors.grey[700],
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Scheme()),
            ).then((value) => MostrarEsquema(context, value));
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.videocam,
            color: Colors.white,
          ),
          label: 'Añadir video',
          backgroundColor: Colors.grey[700],
          onTap: () async {
            // await Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => CameraExampleHome()),
            // ).then((value) => MostrarVideo(context, value));
            ImagePickerWidget picker = ImagePickerWidget(mostrarFoto: MostrarFoto,mostrarVideo: MostrarVideo);
            picker.ShowPickVideo(context, ImageSource.camera);
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.photo_camera,
            color: Colors.white,
          ),
          label: 'Añadir foto',
          backgroundColor: Colors.grey[700],
          onTap: () async {
            // await Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => CameraExampleHome()),
            // ).then((value) => MostrarFoto(context, value));
            ImagePickerWidget picker = ImagePickerWidget(mostrarFoto: MostrarFoto,mostrarVideo: MostrarVideo);
            picker.ShowPickImage(context, ImageSource.camera);
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          label: 'Añadir comentario',
          backgroundColor: Colors.grey[700],
          onTap: expediente.inicio? () async {
            if(expediente.first_visit){
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Add_Comment(expediente: expediente,)),
            );
            }else {
              await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => First_Visit(expediente: expediente,)));
            }
          }:(){
            Message_Snack m = Message_Snack(context: context);
            m.msg('Debe iniciar el expediente');
          },
        ),
      ],
    );
  }
}