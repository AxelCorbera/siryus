import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/functions/message_snack.dart';
import 'package:fixapp/globals.dart';
import 'package:fixapp/objects/file.dart';
import 'package:fixapp/pages/home.dart';
import 'package:fixapp/pages/scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:painter/painter.dart';

class Sign_Contract extends StatefulWidget{
  Sign_Contract({required this.expediente});
  final File expediente;
  _Sign_ContractState createState() => _Sign_ContractState();
}

class _Sign_ContractState extends State<Sign_Contract>{

  static PainterController _newController() {
    PainterController controller = new PainterController();
    controller.thickness = 2.0;
    controller.backgroundColor = Colors.white;
    return controller;
  }

  PainterController _controller = _newController();
  @override
  void initState(){
    super.initState();
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp])
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.background,
        title: Text('Firma contrato presentación'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              _controller.clear();
            },
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: (){
              Navigator.of(context).pushNamed('/Start_Repair');
            },
          ),
          IconButton(
            icon: Icon(Icons.done),
            onPressed: (){
              ///////////////////////
              ///                          GUARDAR LA FIRMA
              ////////////////////////

              File exp = widget.expediente;
              Comment comment = Comment(date: DateTime.now(),
                  author: user, message: '* INICIO REPARACION *', read: false);
              exp.comments.add(comment);
              exp.inicio = true;
              _msg('Firma guardada correctamente');
              _msg('Reparación iniciada');
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/File', (Route<dynamic> route) => route is Home,arguments: exp);
            },
          ),
        ],
      ),
      body:
      Center(
        child: Painter(_controller),
      ),
    );
  }

  void _msg(String msg){
    Message_Snack m = Message_Snack(context: context);
    m.showText(msg);
  }
}