import 'package:fixapp/objects/appointment_date.dart';
import 'package:fixapp/objects/file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../globals.dart';

class Alertas extends StatefulWidget {
  _AlertasState createState() => _AlertasState();
}

class _AlertasState extends State<Alertas> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: _agenda());
  }

  Widget _agenda() {
    //listaCitas = [];
    List<DateTime> list = [];
    List<File> comment2 = [];
    expedientes.forEach((element) {
      list.add(DateTime.parse(element.limit_time));
    });
    list.sort((a, b) {
      return a.compareTo(b);
    });
    list.forEach((element) {
      for (int i = 0; i < list.length; i++) {
        if (element == DateTime.parse(expedientes[i].limit_time))
          comment2.add(expedientes[i]);
      }
    });

    _calcularAlertas(comment2);

    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: comment2.length,
            itemBuilder: (context, index) {
              if(_consultarMensajes(comment2[index].comments)>0) {
                return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30,0,30,0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/images/alerta.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,4,8,4),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(comment2[index].number_file,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold
                                  ),),
                                Text(_consultarMensajes(comment2[index].comments) == 1
                                    ? '1 mensaje sin leer'
                                    : _consultarMensajes(comment2[index].comments)
                                    .toString() +
                                    ' mesajes sin leer',
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.bold
                                ),),
                                Text(comment2[index].address,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                  ),),
                                Text(comment2[index].city,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                  onTap: (){
                    Navigator.of(context).pushNamed('/File',arguments: comment2[index]);
                  },
              );
              }else{
                return Container();
              }
            })
      ],
    );
  }

  void _calcularAlertas(List<File> expedientes) {
    expedientes.forEach((element) {});
  }

  int _consultarMensajes(List<Comment> comments) {
    int i = 0;
    comments.forEach((element) {
      if (!element.read) i++;
    });
    return i;
  }
}
