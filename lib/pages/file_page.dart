import 'dart:async';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:fixapp/components/camera_video.dart';
import 'package:fixapp/components/imagePickerWidget.dart';
import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/functions/message_snack.dart';
import 'package:fixapp/http/requests.dart';
import 'package:fixapp/objects/file.dart';
import 'package:fixapp/objects/obj_image.dart';
import 'package:fixapp/objects/obj_scheme.dart';
import 'package:fixapp/objects/obj_settlement.dart';
import 'package:fixapp/objects/obj_video.dart';
import 'package:fixapp/pages/scheme.dart';
import 'package:fixapp/services/location_service.dart';
import 'package:fixapp/widget/data.dart';
import 'package:fixapp/widget/floatingButton.dart';
import 'package:fixapp/widget/images.dart';
import 'package:fixapp/widget/schemes.dart';
import 'package:fixapp/widget/settlements.dart';
import 'package:fixapp/widget/video_player.dart';
import 'package:fixapp/widget/videos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fixapp/widget/comments.dart';
import 'package:painter/painter.dart';
import 'package:video_player/video_player.dart';
import 'package:fixapp/main.dart';

import '../globals.dart';

typedef OnImageSelected = Function(XFile imageFile);

class File_Page extends StatefulWidget {
  const File_Page(this.expediente);
  final File expediente;
  @override
  _File_PageState createState() => _File_PageState();
}

class _File_PageState extends State<File_Page> {
  late CameraPosition _camaraLugar;
  LocationService locationService = LocationService();
  VideoPlayerController? controller;
  late XFile imageFile;
  late OnImageSelected onImageSelected;
  List<Obj_Image> imagenes = [];
  List<Obj_Video> videos = [];
  List<Obj_Scheme> esquemas = [];
  bool back = false;

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    if(!Navigator.canPop(context)){
      back = false;
    }else{
      back = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    _buscarCoordenadas();
    return Scaffold(
      appBar: AppBar(
        leading: back?
        null:
        IconButton(onPressed: (){
          Navigator.of(context).pushNamed('/Home');
        }, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colores.background,
        title: const Text('Expediente'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed("/Maps", arguments: _camaraLugar);
          }, icon: const Icon(Icons.place)),
        ],
      ),
      floatingActionButton: FloatingButton(MostrarFoto: MostrarFoto,
          MostrarVideo: MostrarVideo,
          MostrarEsquema: MostrarEsquema,
      expediente: widget.expediente,),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Data(expediente: widget.expediente),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: ElevatedButton(
                        onPressed: widget.expediente.inicio?() {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed("/New_Action", arguments: widget.expediente);
                        }:null,
                        child: const Text('ACCIONES'),
                        style: ButtonStyle(
                          backgroundColor: widget.expediente.inicio?
                          MaterialStateProperty.resolveWith((states) => Colores.gris):
                          MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: ElevatedButton(
                        onPressed: !widget.expediente.inicio?() {
                          iniciar(context);
                        }:null,
                        child: const Text('INICIO'),
                        style: ButtonStyle(
                          backgroundColor: !widget.expediente.inicio?
                          MaterialStateProperty.resolveWith((states) => Colores.gris):
                          MaterialStateProperty.resolveWith((states) => Colors.grey[300])
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'COMENTARIOS',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Divider(),
                widget.expediente.comments.isEmpty
                    ? Text(
                        'No hay comentarios',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                        ),
                      )
                    : Comments(
                        comments: widget.expediente.comments,
                        expediente: widget.expediente,
                        actualizar: actualizar,
                      ),
                //comentarios(context, widget.expediente.comments, widget.expediente),
                const SizedBox(
                  height: 30,
                ),
                Settlements(expediente: widget.expediente,liquidaciones: widget.expediente.settlement),
                const SizedBox(
                  height: 30,
                ),
                Images(imagenes: imagenes, mostrarFoto: MostrarFoto,mostrarVideo: MostrarVideo,),
                const SizedBox(
                  height: 30,
                ),
                Videos(videos: videos, mostrarFoto: MostrarFoto,mostrarVideo: MostrarVideo,),
                const SizedBox(
                  height: 30,
                ),
                Schemes(schemes: esquemas,),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void actualizar() {
    setState(() {});
  }

  void MostrarFoto(BuildContext context, XFile image) {
    io.File file = io.File(image.path);
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
                ButtonBar(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "DESCARTAR",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                    TextButton(
                        onPressed: () {
                          Obj_Image ima = Obj_Image(
                              image: image,
                              time: DateTime.now(),
                              author: user,
                              file: widget.expediente.number_file);

                          imagenes.add(ima);
                          Navigator.pop(context);
                          setState(() {});
                          Message_Snack m = Message_Snack(context: context);
                          m.msg('Foto agregada correctamente');
                        },
                        child: const Text(
                          "AÑADIR",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }

  void MostrarEsquema(BuildContext context, PictureDetails picture) {
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
                      future: picture.toPNG(),
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
                ButtonBar(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "DESCARTAR",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                    TextButton(
                        onPressed: () {
                          Obj_Scheme ima = Obj_Scheme(
                              image: picture,
                              time: DateTime.now(),
                              author: user,
                              file: widget.expediente.number_file);

                          esquemas.add(ima);
                          Navigator.pop(context);
                          setState(() {});
                          actualizar();
                          Message_Snack m = Message_Snack(context: context);
                          m.msg('Esquema agregado correctamente');
                        },
                        child: const Text(
                          "AÑADIR",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }

  void iniciar(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    child:  const Text(
                        'Advertencia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,12,0,8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child:  const Text(
                      '¿Desea iniciar la reparación?',
                      style: TextStyle(

                      ),
                    ),
                  ),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "CANCELAR",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed("/Start_Repair", arguments: widget.expediente);
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
  MostrarVideo(BuildContext context, XFile image) {
    if (kDebugMode) {
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>. MOSTRAR VIDEO');
    }
    io.File file = io.File(image.path);

    controller = VideoPlayerController.file(file)
      ..addListener(() => () {})
      ..setLooping(false)
      ..initialize().then((_) {
        controller?.play();
      }).then((value) => comprobar(image));
  }

  void comprobar(XFile image){
    if(controller!.value.isInitialized){
      _sd(image);
    }else{
      io.File file = io.File(image.path);
      controller = VideoPlayerController.file(file)
        ..addListener(() => () {})
        ..setLooping(false)
        ..initialize().then((_) {
          controller!.play();
        }).then((value) => comprobar(image));
    }
  }

  _sd(XFile image) {
    if(controller?.value.isPlaying == false) {
      setState(() {
      });
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    constraints: const BoxConstraints(
                        minWidth: double.infinity, minHeight: 250),
                    child: controller!.value.isInitialized
                        ? VideoPlayerWidget(controller: controller!)
                        : null,
                  ),
                  Text('el video dura: ' +
                      controller!.value.duration.inSeconds.toString() +
                      ' segundos.'),
                  ButtonBar(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "DESCARTAR",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            controller!.pause();
                            controller!.dispose();
                            controller = null;

                            Obj_Video vid = Obj_Video(
                                video: image,
                                time: DateTime.now(),
                                author: user,
                                file: widget.expediente.number_file);

                            videos.add(vid);
                            Navigator.pop(context);
                            //setState(() {});
                            actualizar();
                            Message_Snack m = Message_Snack(context: context);
                            m.msg('Video agregado correctamente');
                          },
                          child: const Text(
                            "AÑADIR",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )),
                    ],
                  )
                ],
              ),
            );
          });
        });
  }

  Future<void> _buscarCoordenadas() async {
    Request _request = Request();
    String lugar= widget.expediente.address+','+widget.expediente.city;
    locationService = await _request.buscarUbicacion(lugar) as LocationService;
    double lat = locationService.results![0].geometry!.location!.lat as double;
    double lng = locationService.results![0].geometry!.location!.lng as double;
    _camaraLugar = CameraPosition(
        bearing: 0,
        target: LatLng(lat, lng),
        tilt: 0,
        zoom: 17);
    //
  }

}
