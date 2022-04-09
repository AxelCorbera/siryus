import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/functions/message_snack.dart';
import 'package:fixapp/objects/file.dart';
import 'package:fixapp/objects/obj_settlement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../globals.dart';
import 'home.dart';

class Add_Settlement extends StatefulWidget {
  Add_Settlement({required this.expediente});
  final File expediente;
  _Add_SettlementState createState() => _Add_SettlementState();
}

class _Add_SettlementState extends State<Add_Settlement> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  String fechaStr = '';
  TextEditingController _controller = TextEditingController();
  DateTime fecha = DateTime.now();
  String dropdownvalue = '- Seleccionar partida -';
  bool _presupuesto = false;
  bool _urgencia = false;
  String unidades = '';
  String importe = '';

  // List of items in our dropdown menu
  var items = [
    '- Seleccionar partida -',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  Widget build(BuildContext context) {
    _cambiarFecha(null);
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
                  Obj_Settlement sett = Obj_Settlement(
                      date: fecha,
                      settlement: dropdownvalue,
                      settlementDescription: _controller.text,
                      budget: _presupuesto,
                      urgency: _urgencia,
                      units: double.parse(unidades),
                      price: double.parse(importe));
                  exp.settlement.add(sett);

                  m.msg('Partida enviada correctamente');

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(
                          '/File', (Route<dynamic> route) => route is Home,
                          arguments: exp);
                }
              },
            ),
          ],
          title: Text('Nueva liquidación'),
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
                          'Fecha',
                          style: TextStyle(fontSize: 12, color: Colores.gris),
                        )),
                  ),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2018, 3, 5), onChanged: (date) {
                            //print('change $date');
                            //_cambiarFecha(date);
                          }, onConfirm: (date) {
                            print('confirm $date');
                            _cambiarFecha(date);
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.es);
                        },
                        child: Text(
                          fechaStr,
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
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
                      // Initial Value
                      value: dropdownvalue,
                      // Down Arrow Icon
                      //hint: const Icon(Icons.keyboard_arrow_down),
                      alignment: AlignmentDirectional.centerStart,
                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          _controller.text = newValue;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                  Row(
                    children: [
                      Checkbox(
                          value: _presupuesto,
                          onChanged: (value) {
                            setState(() {
                              _presupuesto = !_presupuesto;
                            });
                          }),
                      Text('Es presupuesto'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _urgencia,
                          onChanged: (value) {
                            setState(() {
                              _urgencia = !_urgencia;
                            });
                          }),
                      Text('Urgencia'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        unidades = value;
                      },
                      decoration: InputDecoration(
                        label: Text('Unidades'),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        importe = value;
                      },
                      decoration: InputDecoration(
                        label: Text('Importe'),
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
                ]),
              ),
            ),
          ),
        ));
  }

  void _cambiarFecha(DateTime? date) {
    if (fechaStr == '') {
      fechaStr = DateTime.now().day.toString() +
          '/' +
          DateTime.now().month.toString() +
          '/' +
          DateTime.now().year.toString();
    } else if (date != null) {
      fechaStr = date.day.toString() +
          '/' +
          date.month.toString() +
          '/' +
          date.year.toString();
      print('cambio fecha');
    }
    setState(() {});
  }
}
