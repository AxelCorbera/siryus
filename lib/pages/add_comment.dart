import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/functions/message_snack.dart';
import 'package:fixapp/objects/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../globals.dart';
import 'home.dart';

class Add_Comment extends StatefulWidget{

  Add_Comment({required this.expediente});
  final File expediente;
  _Add_CommentState createState() => _Add_CommentState();
}

class _Add_CommentState extends State<Add_Comment>{

  String text1 = '';
  String text2 = '';
  String text3 = '';
  String text4 = '';
  String text5 = '';
  String text6 = '';
  String text7 = '';
  String text8 = '';
  String text9 = '';

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  }

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.background,
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: (){
              if(_keyForm.currentState!.validate()){
                Message_Snack m = Message_Snack(context: context);
                m.msg('Comentario enviado correctamente');
                File exp = widget.expediente;
                String comentario = 'Origen de avería: '+ text1 +'\n'
                'Posible Rehuse o Fraude: '+ text2 +'\n'
                'Reparación realizada: '+ text3 +'\n'
                'Daños asegurado: '+ text4 +'\n'
                'Antigüedad aprox vvda: '+ text5 +'\n'
                'Perjudicado 1: '+ text6 +'\n'
                'Perjudicado 2: '+ text7 +'\n'
                'Perjudicado 3: '+ text8 +'\n'
                'Notas libres: '+ text9 +'\n';
                Comment comment = Comment(date: DateTime.now(),
                    author: user, message: comentario, read: false);
                exp.comments.add(comment);
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/File', (Route<dynamic> route) => route is Home,arguments: exp);
              }
            },
          ),
        ],
        title: Text(
            'Nuevo comentario'
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width/1.1,
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Origen de avería',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colores.gris
                          ),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      onChanged: (value){
                        text1 = value;
                      },
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(
                            color: Colores.gris
                        ),
                        hintText: 'Privativo, comunitario o de un tercero. Agua'
                            ' sanitaria caliente o fria, desagües, filtraciones,'
                            'fenómennos meterológicos,etc',
                        hintStyle: TextStyle(color: Colors.grey[700],),
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
                      validator: (value){
                        if(value.toString().isEmpty)
                          return 'El campo es obligatorio';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Posible Rehuse o Fraude',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colores.gris
                          ),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      onChanged: (value){
                        text2 = value;
                      },
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(
                            color: Colores.gris
                        ),
                        hintText: 'Siniestro sin cobertura. El asegurado esta'
                            'intentando que el seguro realice todos o parte'
                            'de los trabajos que no gozan de cobertura'
                            '¿que trabajos?',
                        hintStyle: TextStyle(color: Colors.grey[700],),
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
                      validator: (value){
                        if(value.toString().isEmpty)
                          return 'El campo es obligatorio';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Reparación realizada',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colores.gris
                          ),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      onChanged: (value){
                        text3 = value;
                      },
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(
                            color: Colores.gris
                        ),
                        hintText: 'Explicar en que consiste le reparación realizada,'
                            'material, si es definitiva o no, estancia en la que'
                            'realizamos reparación',
                        hintStyle: TextStyle(color: Colors.grey[700],),
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
                      validator: (value){
                        if(value.toString().isEmpty)
                          return 'El campo es obligatorio';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Daños asegurado',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colores.gris
                          ),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      onChanged: (value){
                        text4 = value;
                      },
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(
                            color: Colores.gris
                        ),
                        hintText: 'Daños que presenta nuestro asegurado'
                            'sea provocado por el siniestro o la localización.'
                            ' Tipo de daño, estancia y dimensiones aprox '
                            'de cada estancia',
                        hintStyle: TextStyle(color: Colors.grey[700],),
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
                      validator: (value){
                        if(value.toString().isEmpty)
                          return 'El campo es obligatorio';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Antigüedad aprox vvda',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colores.gris
                          ),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      onChanged: (value){
                        text5 = value;
                      },
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(
                            color: Colores.gris
                        ),
                        hintText: 'Antigüedad aproximada de la vivienda '
                            '¿Tiene reformas realizadas?',
                        hintStyle: TextStyle(color: Colors.grey[700],),
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
                      validator: (value){
                        if(value.toString().isEmpty)
                          return 'El campo es obligatorio';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Perjudicado 1',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colores.gris
                          ),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      onChanged: (value){
                        text6 = value;
                      },
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(
                            color: Colores.gris
                        ),
                        hintText: 'Datos de vvda de perjudicado. Nombre. Teléfono.'
                            'Daños que presenta sea provocado por el siniestro'
                            ' o la localización. Tipo de daño, estancia y'
                            'dimensiones aprox de la estancia.',
                        hintStyle: TextStyle(color: Colors.grey[700],),
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
                      validator: (value){
                        if(value.toString().isEmpty)
                          return 'El campo es obligatorio';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Perjudicado 2',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colores.gris
                          ),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      onChanged: (value){
                        text7 = value;
                      },
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(
                            color: Colores.gris
                        ),
                        hintText: 'Datos de vvda de perjudicado. Nombre. Teléfono.'
                            'Daños que presenta sea provocado por el siniestro'
                            ' o la localización. Tipo de daño, estancia y'
                            'dimensiones aprox de la estancia.',
                        hintStyle: TextStyle(color: Colors.grey[700],),
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
                      validator: (value){
                        if(value.toString().isEmpty)
                          return 'El campo es obligatorio';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Perjudicado 3',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colores.gris
                          ),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      onChanged: (value){
                        text8 = value;
                      },
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(
                            color: Colores.gris
                        ),
                        hintText: 'Datos de vvda de perjudicado. Nombre. Teléfono.'
                            'Daños que presenta sea provocado por el siniestro'
                            ' o la localización. Tipo de daño, estancia y'
                            'dimensiones aprox de la estancia.',
                        hintStyle: TextStyle(color: Colors.grey[700],),
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
                      validator: (value){
                        if(value.toString().isEmpty)
                          return 'El campo es obligatorio';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Notas libres',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colores.gris
                          ),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      onChanged: (value){
                        text9 = value;
                      },
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(
                            color: Colores.gris
                        ),
                        hintText: 'Introduzca información adicional si lo necesita '
                            '(no obligatorio).',
                        hintStyle: TextStyle(color: Colors.grey[700],),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}