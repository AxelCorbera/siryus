import 'package:fixapp/objects/file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Read_Comment {

  Read_Comment({required this.expediente, required this.actualizar});
  final Function actualizar;
  final File expediente;

  void LeerMsg(BuildContext context, int index, File expediente) {

    List<DateTime> list = [];
    List<Comment> comment2 = [];
    expediente.comments.forEach((element) {
      list.add(element.date);
    }) ;
    list.sort((a,b) {
      return b.compareTo(a);
    });

    list.forEach((element) {
      for(int i = 0; i<list.length; i++){
        if(element == expediente.comments[i].date)
          comment2.add(expediente.comments[i]);
      }
    });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    comment2[index].date.day.toString() +
                        '/' +
                        comment2[index].date.month.toString() +
                        '/' +
                        comment2[index].date.year.toString() +
                        ' a las ' +
                        comment2[index].date.hour.toString() +
                        ':' +
                        comment2[index].date.minute.toString() +
                        ' (' +
                        comment2[index].author +
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
                    comment2[index].message,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                ButtonBar(
                  children: [
                    FlatButton(
                      color: Colors.grey,
                        onPressed: () {
                          Navigator.of(context).pop();
                          comment2[index].read = true;
                          actualizar();
                        },
                        child: Text(
                          "CERRAR",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15),
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }
}