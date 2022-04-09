import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/widget/first_visit/damage_detail.dart';
import 'package:fixapp/widget/first_visit/stay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Damage_Detail extends StatefulWidget {
  Damage_Detail(
      {required this.id,
      required this.guardar,
      required this.borrar,
      required this.dano,
      required this.medidas});
  final int id;
  final Function guardar;
  final Function borrar;
  late String dano;
  late String medidas;

  _Damage_DetailState createState() => _Damage_DetailState();
}

class _Damage_DetailState extends State<Damage_Detail> {
  bool oficio = true;

  TextEditingController _controllerDano = TextEditingController();
  TextEditingController _controllerMedidas = TextEditingController();

  String inicialDano = '';
  String inicialMedidas = '';

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _controllerDano.text = widget.dano;
    _controllerMedidas.text = widget.medidas;
    cargarDatos();
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
            color: oficio ? Colors.blueAccent[100] : null,
            borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.blue)),
                onPressed: () {
                  setState(() {
                    oficio = !oficio;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(_textoEstancia('DAÑO')),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red[300])),
                onPressed: () {
                  //setState(() {
                  widget.borrar(widget.id);
                  //});
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 5.5,
                  child: Text('QUITAR'),
                ),
              ),
            ],
          ),
          if (oficio)
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width / 1.15,
              child: Form(
                key: _keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: TextFormField(
                        controller: _controllerDano,
                        onChanged: (value) {
                          widget.dano = value;
                        },
                        onEditingComplete: () {
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                          FocusScope.of(context).requestFocus(FocusNode());
                          widget.guardar(widget);
                        },
                        decoration: InputDecoration(
                          hintText: 'Daño',
                          fillColor: Colors.blueAccent[100],
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _controllerMedidas,
                            onChanged: (value) {
                              widget.medidas = value;
                            },
                            onEditingComplete: () {
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                              FocusScope.of(context).requestFocus(FocusNode());
                              widget.guardar(widget);
                            },
                            decoration: InputDecoration(
                              hintText: 'Medidas',
                              fillColor: Colors.blueAccent[100],
                              floatingLabelStyle:
                                  TextStyle(color: Colores.gris),
                              // hintText: 'Privativo, comunitario o de un tercero. Agua'
                              //     ' sanitaria caliente o fria, desagües, filtraciones,'
                              //     'fenómennos meterológicos,etc',
                              hintStyle: TextStyle(
                                color: Colors.grey[700],
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colores.background),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colores.background),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colores.background),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value.toString().isEmpty)
                                return 'El campo es obligatorio';
                            },
                          ),
                        ),
                        Text('m2'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  void cargarDatos() {
    print(_controllerDano.text);
    // WidgetsBinding.instance
    //     ?.addPostFrameCallback((_) => rellenarDatos(context));
  }

  void rellenarDatos(BuildContext context) {
    _controllerDano.text = widget.dano;
    _controllerMedidas.text = widget.medidas;
  }

  _textoEstancia(String dropdownvalue) {
    String accion = 'OCULTAR';
    if (oficio) {
      accion = 'OCULTAR';
    } else {
      accion = 'MOSTRAR';
    }
    String textoBoton = '';
    if (dropdownvalue == '- Seleccione oficio -') {
      textoBoton = '$accion OFICIO';
    } else {
      textoBoton = '$accion ' + dropdownvalue.toUpperCase();
    }
    return textoBoton;
  }
}
