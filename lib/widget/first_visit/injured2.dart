import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/widget/first_visit/job.dart';
import 'package:fixapp/widget/first_visit/stay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Injured2 extends StatefulWidget {
  _Injured2State createState() => _Injured2State();
}

class _Injured2State extends State<Injured2> {
  int ids = 0;
  bool injured = false;
  bool crearInstancia = false;
  List<Stay> estancias = [];
  TextEditingController _controllerDireccion = TextEditingController();
  TextEditingController _controllerNombre = TextEditingController();
  TextEditingController _controllerTelefono = TextEditingController();

  Widget build(BuildContext) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              injured = !injured;
            });
          },
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 2,
              child: Text(_textoEstancia(_controllerNombre))),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.red[300])),
          onPressed: () {
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 5,
            child: Text('QUITAR'),
          ),
        ),
      ]),
      if (injured)
        Container(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _controllerDireccion,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Datos vvda.',
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
                  TextFormField(
                    controller: _controllerNombre,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Nombre',
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
                  TextFormField(
                    controller: _controllerTelefono,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Teléfono',
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
                  widEstancias(),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green[300])
                        ),
                        onPressed: () {
                          setState(() {
                            Stay stay = Stay(
                              id: ids,
                              estancia: '',
                              ancho: '',
                              largo: '',
                              oficios: [],
                              borrar: borrar,
                              guardar: guardar,
                              actualizar: actualizar,
                            );
                            estancias.add(stay);
                            ids++;
                          });
                        },
                        child: Text('AÑADIR ESTANCIA')),
                  ),
                ],
              ),
            ))
    ]);
  }

  Widget widEstancias() {
    print('rebuild estancias');
    List<Widget> lista = [];
    List<Job> listaOfi = [];
    estancias.forEach((element) {
      listaOfi = [];
      element.oficios.forEach((element2) {
        Job ofi = Job(
          id: element2.id,
          guardar: guardar,
          borrar: borrar,
          oficio: element2.oficio,
          danos: element2.danos,
        );
        listaOfi.add(ofi);
        print('se agrega oficio '+
            element2.oficio + ' a ' +
            element.estancia);
      });

      Stay stay = Stay(
        id: element.id,
        estancia: element.estancia,
        ancho: element.ancho,
        largo: element.largo,
        oficios: listaOfi,
        borrar: borrar,
        guardar: guardar,
        actualizar: actualizar,
      );

      lista.add(Padding(
        padding: const EdgeInsets.fromLTRB(0,5,0,5),
        child: stay,
      ));
    });

    return Column(
      children: lista,
    );
  }

  actualizar() {
    setState(() {});
  }

  guardar(Stay estancia) {
    String strOfi = '';
    estancia.oficios.forEach((element) {
      strOfi = strOfi +
          element.id.toString() +
          '>' +
          element.oficio.toString() +
          '>';
    });

    print(estancia.id.toString() +
        '>' +
        estancia.estancia.toString() +
        '>' +
        estancia.ancho.toString() +
        '>' +
        estancia.largo.toString() +
        '>' +
        estancia.oficios.toString() +
        '>' +
        '>' +
        strOfi);
    int index = 0;
    for (int i = 0; i < ids; i++) {
      if (estancias[i].id == estancia.id) {
        index = i;
        break;
      }
    }
    estancias[index] = estancia;
  }

  borrar(int id) {
    int index = 0;

    for (int i = 0; i < ids; i++) {
      if (estancias[i].id == id) {
        index = i;
        break;
      }
    }

    estancias.removeAt(index);

    setState(() {
      log();
    });
  }

  void log(){
    String strOfi = '';
    estancias.forEach((estancia) {
      strOfi = '';
      estancia.oficios.forEach((element) {
        strOfi = strOfi +
            element.id.toString() +
            '>' +
            element.oficio.toString() +
            '>';
      });

      print(estancia.id.toString() +
          '>' +
          estancia.estancia.toString() +
          '>' +
          estancia.ancho.toString() +
          '>' +
          estancia.largo.toString() +
          '>' +
          estancia.oficios.toString() +
          '>' +
          '>' +
          strOfi);
    });
  }
  String _textoEstancia(TextEditingController controllerNombre) {
    String accion = 'OCULTAR';
    if (injured) {
      accion = 'OCULTAR';
    } else {
      accion = 'MOSTRAR';
    }

    String textoBoton = '';
    if (controllerNombre.text.isEmpty) {
      textoBoton = '$accion PERJUDICADO';
    } else {
      textoBoton = '$accion ' + _controllerNombre.text.toUpperCase();
    }
    return textoBoton;
  }
}
