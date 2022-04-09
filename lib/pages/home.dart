import 'dart:io';

import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/globals.dart' as globals;
import 'package:fixapp/pages/sync_up.dart';
import 'package:fixapp/widget/home/agenda.dart';
import 'package:fixapp/widget/home/alertas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState(){
    super.initState();
    permisos();
  }
  int alerts = 0;
  bool agenda = true;
  bool expedientes = false;
  bool alertas = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext) {
    _calcularAlertas();
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Siryus'),
          backgroundColor: Colores.background,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value){
                if(value == "Ajustes"){
                  Navigator.of(context).pushNamed("/Change_Code")
                      .then((value) => onBackPressed(value));
                }else{
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Sync_Up()),
                        (Route<dynamic> route) => false,
                  );
                }
              },
              itemBuilder: (context) {
                return {'Ajustes', 'Sincronizar'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
            //IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
          ),
        backgroundColor: Colors.grey[300],
        drawer: _drawer(),
        body: Column(
          children: [
            Container(
              height: 50,
              color: Colores.gris,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      FlatButton(onPressed: (){
                        setState(() {
                          agenda = true;
                          expedientes = false;
                          alertas = false;
                        });
                      }, child: Text("AGENDA",style: TextStyle(color: agenda?Colors.white:Colors.white54),)),
                      if(agenda)
                        Container(
                        height: 2,
                        width: 80,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      FlatButton(onPressed: (){
                        setState(() {
                          agenda = false;
                          expedientes = true;
                          alertas = false;
                        });
                      }, child: Text("EXPEDIENTES",style: TextStyle(color: expedientes?Colors.white:Colors.white54),)),
                      if(expedientes)
                      Container(
                        height: 2,
                        width: 80,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FlatButton(onPressed: (){
                        setState(() {
                          agenda = false;
                          expedientes = false;
                          alertas = true;
                        });
                      }, child: Text("ALERTAS ("+alerts.toString()+")",style: TextStyle(color: alertas?Colors.white:Colors.white54),)),
                      if(alertas)
                      Container(
                        height: 2,
                        width: 80,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
            if(agenda)
              new Agenda(),
            if(alertas)
              new Alertas()
          ],
        ),
      );
  }

  Widget _drawer(){
    return Drawer(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Colores.background
                    ]
                  )
                ),
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/logo3.png'),
                          fit: BoxFit.fitWidth),
                  ),
                ),
              )
            ],
          ),
          ListTile(
            leading: Icon(Icons.send),
            title: Text("Reportar error",
            style: TextStyle(
              color: Colors.black
            ),),
            onTap: (){
              Navigator.of(context).pop();
              _reportar(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Ajustes",
              style: TextStyle(
                  color: Colors.black
              ),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/Change_Code")
              .then((value) => onBackPressed(value));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Información",
              style: TextStyle(
                  color: Colors.black
              ),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/Information");
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text("Salir",
              style: TextStyle(
                  color: Colors.black
              ),),
            onTap: (){
              Navigator.of(context).pop();
              _salir(context);
            },
          ),
        ],
      ),
    );
  }

  void _reportar(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Reportar error",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Introduzca la descripción del error",
                    style: TextStyle(
                        fontSize: 15
                    ),),
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey
                  ),
                  minLines: 5,
                  maxLines: 10,
                ),
                ButtonBar(
                  children: [
                    FlatButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("CANCELAR",
                    style: TextStyle(color: Colors.black,fontSize: 15),)),
                    FlatButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("ENVIAR",
                      style: TextStyle(color: Colors.black,fontSize: 15),)),
                  ],
                )
              ],
            ),
          );
        });
  }
  void _salir(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Salir",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("¿Desea cerrar la aplicación?",
                    style: TextStyle(
                        fontSize: 15
                    ),),
                ),
                ButtonBar(
                  children: [
                    FlatButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("CANCELAR",
                      style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15),)),
                    FlatButton(onPressed: (){
                      exit(0);
                    }, child: Text("SALIR",
                      style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15),)),
                  ],
                )
              ],
            ),
          );
        });
  }

  void onBackPressed(var value) {
    if(value != null)
    if(value as bool == true){
    _scaffoldKey.currentState!.showSnackBar(new SnackBar(
        content: new Text("Se ha modificado exitosamente!")));
    }else{
      _scaffoldKey.currentState!.showSnackBar(new SnackBar(
          content: new Text("No hubo cambios")));
    }
  }

  Future<void> permisos() async {

    var status = await Permission.location.status;
    if(status.isDenied){
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      print(statuses[Permission.location]);
    }


  }
  void _calcularAlertas() {
    alerts=0;
    globals.expedientes.forEach((element) {
      element.comments.forEach((element) {
        if(!element.read){
          alerts++;
        }
      });
    });
  }
}

