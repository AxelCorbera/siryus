import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/functions/message_snack.dart';
import 'package:fixapp/objects/file.dart';
import 'package:fixapp/objects/obj_settlement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../globals.dart';
import 'home.dart';

class Modify_Settlement extends StatefulWidget {
  Modify_Settlement({required this.expediente, required this.liquidacion});
  late File expediente;
  final Obj_Settlement liquidacion;
  _Modify_SettlementState createState() => _Modify_SettlementState();
}

class _Modify_SettlementState extends State<Modify_Settlement> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  String fechaStr = '';
  TextEditingController _controller = TextEditingController();
  DateTime fecha = DateTime.now();
  String importe = '';

  Widget build(BuildContext context) {
    if(widget.liquidacion.date_modify!=null){
      _controller.text = widget.liquidacion.date_modify!.day.toString() +'/'+
          widget.liquidacion.date_modify!.month.toString() +'/'+
          widget.liquidacion.date_modify!.year.toString();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colores.background,
          actions: [
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                if (_keyForm.currentState!.validate()) {
                  Message_Snack m = Message_Snack(context: context);
                  File exp = widget.expediente;

                  exp.settlement.forEach((element) {
                    if(element.date == widget.liquidacion.date
                    && element.settlementDescription == widget.liquidacion.settlementDescription){
                     element.price = double.parse(importe);
                     element.date_modify = fecha;
                    }
                  });
                  m.msg('Partida modificada correctamente');
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(
                      '/File', (Route<dynamic> route) => route is Home,
                      arguments: exp);
                }
              },
            ),
          ],
          title: Text('Modificar liquidación'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Form(
                key: _keyForm,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Importe ('+
                          widget.liquidacion.settlementDescription+
                          ')',
                          style: TextStyle(fontSize: 16, color: Colores.gris,
                          fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        importe = value;
                      },
                      decoration: InputDecoration(
                        hintText: widget.liquidacion.price.toString(),
                        fillColor: Colors.white,
                        floatingLabelStyle: TextStyle(color: Colores.gris),
                        // hintText: 'Privativo, comunitario o de un tercero. Agua'
                        //     ' sanitaria caliente o fria, desagües, filtraciones,'
                        //     'fenómennos meterológicos,etc',
                        hintStyle: TextStyle(
                          color: Colors.grey[700],
                        ),
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
                      validator: (value) {
                        if (value.toString().isEmpty)
                          return 'El campo es obligatorio';
                        if (value.toString().characters.contains(','))
                          return 'El formato es incorrecto';
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: TextFormField(
                          controller: _controller,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            floatingLabelStyle: TextStyle(color: Colores.gris),
                            // hintText: 'Privativo, comunitario o de un tercero. Agua'
                            //     ' sanitaria caliente o fria, desagües, filtraciones,'
                            //     'fenómennos meterológicos,etc',
                            hintStyle: TextStyle(
                              color: Colors.grey[700],
                            ),
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
                          validator: (value) {
                            if (value.toString().isEmpty)
                              return 'El campo es obligatorio';
                          },
                        ),
                      ),
                      Container(
                          child: ElevatedButton(
                            onPressed: () {
                                    _cambiarFecha();
                                  },
                            child: Text(
                              'ESTABLECER',
                              style: TextStyle(fontSize: 16),
                            ),
                          )),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ));
  }

  void _cambiarFecha() {

      _controller.text = DateTime.now().day.toString() +
          '/' +
          DateTime.now().month.toString() +
          '/' +
          DateTime.now().year.toString();

    setState(() {});
  }
}
