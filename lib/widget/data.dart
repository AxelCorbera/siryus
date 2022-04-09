import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fixapp/objects/file.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
class Data extends StatelessWidget {
  Data({required this.expediente});

  final File expediente;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            expediente.holder,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          child: Text(
            '(' + expediente.type + ')',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          child: Text(
            expediente.number_file,
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          child: Text(
            expediente.name_company,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          child: Text(
            expediente.address,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          child: Text(
            expediente.postal_code,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
            ),
          ),
        ),
        GestureDetector(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Row(
                children: [
                  Text(
                    'telefono 1: ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                  Text(expediente.f_phone,
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: expediente.f_phone!=''?(){
            llamar(context,expediente.f_phone);
          }:null,
        ),
        GestureDetector(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Row(
                children: [
                  Text(
                    'telefono 2: ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                  Text(expediente.s_phone,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: expediente.s_phone!=''?(){
            llamar(context, expediente.s_phone);
          }:null,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          child: Text(
            'Cita: ' +
                expediente.date.hour.toString() +
                ':' +
                expediente.date.minute.toString() +
                'h - Dur: ' +
                expediente.duration.toString() +
                ':00 (' +
                expediente.date.day.toString() +
                '/' +
                expediente.date.month.toString() +
                '/' +
                expediente.date.year.toString() +
                ')',
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'ESTADO DEL EXPEDIENTE: ' + expediente.status,
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  callNumber(String number) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  void llamar(BuildContext context, String numero) {
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
                    child:  Text(
                      '¿Desea llamar al numero $numero?',
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
                          callNumber(numero);
                        },
                        child: const Text(
                          "LLAMAR",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }
}