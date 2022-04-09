import 'package:fixapp/components/imagePickerWidget.dart';
import 'package:fixapp/objects/file.dart';
import 'package:fixapp/objects/obj_image.dart';
import 'package:fixapp/objects/obj_settlement.dart';
import 'package:fixapp/pages/modify_settlement.dart';
import 'package:fixapp/widget/show_dialog/show_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class Settlements extends StatelessWidget{
  Settlements({required this.liquidaciones, required this.expediente});
  final List<Obj_Settlement> liquidaciones;
  final File expediente;
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LIQUIDACIONES',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Divider(),
        liquidaciones.isEmpty
            ? Text(
          'No hay liquidaciones disponibles',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
          ),
        )
            : Container(
          height: 150,
          child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              itemCount: liquidaciones.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Modify_Settlement(expediente: expediente, liquidacion: liquidaciones[index],)));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height/14,
                    child: Card(
                      color: Colors.grey[300],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex:1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(_fecha(liquidaciones[index].date)),
                            ),
                          ),
                          Expanded(
                            flex:3,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                              child: Container(
                                child: Text(liquidaciones[index].settlementDescription),
                              ),
                            ),
                          ),
                          Expanded(
                            flex:1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(liquidaciones[index].units.toString()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  String _fecha(DateTime date) {
    String fecha = date.day.toString() + '/' +
        date.month.toString() + '/' +
        date.year.toString();
    return fecha;
  }
}