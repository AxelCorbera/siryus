import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/widget/first_visit/damage_detail.dart';
import 'package:fixapp/widget/first_visit/stay.dart';
import 'package:flutter/material.dart';

class Job extends StatefulWidget {
  Job({
    required this.id,
    required this.guardar,
    required this.borrar,
    required this.oficio,
    required this.danos,

  });
  final int id;
  final Function guardar;
  final Function borrar;
  late String oficio;
  late String ancho;
  late String largo;
  late List<Damage_Detail> danos;

  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  bool oficio = true;

  int ids = 0;
  List<Damage_Detail> danos = [];

  String dropdownvalue = '- Seleccione oficio -';

  var items = [
    '- Seleccione oficio -',
    'Fontanero',
    'Albañil',
    'Pintor',
    'Parquetista',
    'Electricista',
    'Carpintero',
    'Otro',
  ];
  @override
  Widget build(BuildContext context) {
    cargarDatos();
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
          color: oficio ? Colors.orangeAccent[100] : null,
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.orange[300])),
              onPressed: () {
                setState(() {
                  oficio = !oficio;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Text(_textoEstancia(dropdownvalue)),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.red[300])),
              onPressed: () {
                setState(() {
                  widget.borrar(widget.id);
                });
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.orangeAccent[100],
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
                        widget.oficio = newValue!;
                        dropdownvalue = newValue;
                        widget.guardar(widget);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                widDanos(),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.blue)),
                        onPressed: () {
                          setState(() {
                            Damage_Detail dano = Damage_Detail(
                              id: ids,
                              guardar: guardar,
                              borrar: borrar,
                              dano: '',
                              medidas: '',
                            );
                            danos.add(dano);
                            ids++;
                            setState(() {});
                          });
                        },
                        child: Text('AÑADIR DAÑO')),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }

  Widget widDanos() {
    print('(job) rebuild > dano > ' + danos.length.toString());
    print('(job) rebuild > dano detalle > ');
    List<Widget> lista = [];
    danos.forEach((element) {
      lista.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Damage_Detail(
          id: element.id,
          guardar: guardar,
          borrar: borrar,
          dano: element.dano,
          medidas: element.medidas,
        ),
      ));
      print('(job) se agrega dano ' + element.dano);
    });

    return Column(
      children: lista,
    );
  }

  void cargarDatos() {
    //print(estanci);
    if (widget.oficio != '') {
      dropdownvalue = widget.oficio;
      danos = widget.danos;
    }
  }

  borrar(int id) {
    //print("id: " + id.toString());
    int index = 0;

    for (int i = 0; i < ids; i++) {
      if (danos[i].id == id) {
        //print(estancias[i].id.toString() + " ?? " + id.toString() + ' i=$i');
        index = i;
        break;
      }
    }
    //print('borrar $index');
    danos.removeAt(index);

    setState(() {
      //print(estancias.length);
    });
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

  guardar(Damage_Detail dano) {
    int index = 0;
    for (int i = 0; i < ids; i++) {
      print('(job guardar) dano > ' +
          dano.id.toString() +
          ' detalle > ' +
          dano.dano);
      if (danos[i].id == dano.id) {
        index = i;
        break;
      }
    }
    danos[index] = dano;
    widget.danos = danos;
    setState(() {
      widget.guardar(widget);
    });
  }
}
