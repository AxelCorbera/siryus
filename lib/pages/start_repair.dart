import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/objects/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Start_Repair extends StatefulWidget{

  Start_Repair({required this.expediente});
  final File expediente;
  _Start_RepairState createState() => _Start_RepairState();
}

class _Start_RepairState extends State<Start_Repair>{

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.background,
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: (){
              Navigator.of(context).pushNamed('/Sign_Contract', arguments: widget.expediente);
            },
          ),
        ],
        title: Text(
          'Siryus'
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/1.1,
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Introduzca los datos del asegurado/perjuudicado:',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colores.gris
                      ),)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      floatingLabelStyle: TextStyle(
                        color: Colores.gris
                      ),
                      labelText: 'Nombre y apellidos',
                      hintStyle: TextStyle(color: Colores.gris),
                      labelStyle: TextStyle(height: 0.2,
                      color: Colores.gris),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colores.background),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colores.background),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colores.background),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      floatingLabelStyle: TextStyle(
                          color: Colores.gris
                      ),
                      labelText: 'DNI',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                      labelStyle: TextStyle(height: 0.2,
                          color: Colores.gris),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colores.background),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colores.background),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colores.background),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}