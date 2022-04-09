import 'package:fixapp/functions/read_comment.dart';
import 'package:fixapp/objects/file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  Comments(
      {required this.comments,
      required this.expediente,
      required this.actualizar});

  final Function actualizar;
  final List<Comment> comments;
  final File expediente;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Comentarios(context, this.comments, this.expediente);
  }

  Widget Comentarios(
      BuildContext context, List<Comment> comment, File expediente) {
    List<DateTime> list = [];
    List<Comment> comment2 = [];
    comment.forEach((element) {
      list.add(element.date);
    });
    list.sort((a, b) {
      return b.compareTo(a);
    });

    list.forEach((element) {
      for (int i = 0; i < list.length; i++) {
        if (element == comment[i].date) comment2.add(comment[i]);
      }
    });
    return Column(
      children: comentarios(context, comment2),
    );
  }

  List<Widget> comentarios(BuildContext context, List<Comment> c) {
    List<Widget> com = [];
    c.forEach((element) {
      com.add(Padding(
        padding: const EdgeInsets.fromLTRB(0,6,0,6,),
        child: GestureDetector(
          onTap: () {
            Read_Comment leer =
                new Read_Comment(expediente: expediente, actualizar: actualizar);
            int i = 0;
            int index = 0;
            c.forEach((element1) {
              if(element.date == element1.date &&
                  element.message == element1.message){
                index = i;
              }
              i++;
            });
            leer.LeerMsg(context, index, expediente);
            //_leerMsg(context, element.hashCode, widget.expediente);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            color: element.read ? Colors.grey[200] : Colors.red[200],
            //height: MediaQuery.of(context).size.height/14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    element.date.day.toString() +
                        '/' +
                        element.date.month.toString() +
                        '/' +
                        element.date.year.toString() +
                        ' a las ' +
                        element.date.hour.toString() +
                        ':' +
                        element.date.minute.toString() +
                        ' (' +
                        element.author +
                        ')',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    element.message,
                    //maxLines: 20,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    });
    return com;
  }
}
