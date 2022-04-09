import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/objects/estancia.dart';
import 'package:fixapp/widget/first_visit/damage_detail.dart';
import 'package:fixapp/widget/first_visit/job.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Stay extends StatefulWidget {
  Stay(
      {required this.id,
      required this.estancia,
      required this.ancho,
      required this.largo,
      required this.oficios,
      required this.borrar,
      required this.guardar,
      required this.actualizar,});
  final int id;
  final Function borrar;
  final Function guardar;
  final Function actualizar;
  late String estancia;
  late String ancho;
  late String largo;
  late List<Job> oficios;
  //Job oficio;
  _StayState createState() => _StayState();
}

class _StayState extends State<Stay> {
  int ids = 0;
  late bool estancia = true;
  List<Job> oficios = [];
  TextEditingController _controllerAncho = TextEditingController();
  TextEditingController _controllerLargo = TextEditingController();

  String dropdownvalue = '- Seleccione estancia -';

  var items = [
    '- Seleccione estancia -',
    'Cocina',
    'Salón',
    'Hall',
    'Pasillo',
    'Comedor',
    'Dormitorio principal',
    '2º dormitorio',
    '3º dormitorio',
    'Baño principal',
    'Despacho',
    'Aseo',
    'Terraza',
    'Otro',
  ];

  //@override
  // void initState(){
  //   super.initState();
  //   _controllerLargo.text = widget.largo;
  //   _controllerAncho.text = widget.ancho;
  //   //dropdownvalue = widget.estancia;
  //   print(widget.largo);
  // }
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _controllerLargo.text = widget.largo;
    _controllerAncho.text = widget.ancho;
    cargarDatos();
    return Container(
      decoration: BoxDecoration(
          color: estancia ? Colors.green[100] : null,
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green[300])
              ),
              onPressed: () {
                setState(() {
                  estancia = !estancia;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 2,
                child: Text(_textoEstancia(dropdownvalue)),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.red[300])),
              onPressed: () {
                setState(() {
                  oficios = [];
                  widget.oficios = oficios;
                  widget.borrar(widget.id);
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 5,
                child: Text('QUITAR'),
              ),
            ),
          ],
        ),
        if (estancia)
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width / 1.15,
            child: Form(
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.green[100],
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
                          widget.estancia = newValue!;
                          widget.oficios = oficios;
                          widget.guardar(widget);
                          dropdownvalue = newValue;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _controllerAncho,
                          onChanged: (value) {
                            widget.ancho = value;
                            widget.oficios = oficios;
                          },
                          onEditingComplete: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            FocusScope.of(context).requestFocus(FocusNode());
                            widget.guardar(widget);
                          },
                          decoration: InputDecoration(
                            hintText: 'Ancho',
                            fillColor: Colors.green[100],
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
                      Text('x'),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _controllerLargo,
                          onChanged: (value) {
                            widget.largo = value;
                            widget.oficios = oficios;
                            //widget.guardar(widget);
                          },
                          onEditingComplete: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            FocusScope.of(context).requestFocus(FocusNode());
                            widget.guardar(widget);
                          },
                          decoration: InputDecoration(
                            hintText: 'Largo',
                            fillColor: Colors.green[100],
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  widOficios(),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.orange[300])),
                        onPressed: () {
                          setState(() {
                            Job oficio = Job(
                              id: ids,
                              guardar: guardar,
                              borrar: borrar,
                              oficio: '',
                              danos: [],
                            );
                            oficios.add(oficio);
                            print('ids $ids');
                            ids++;
                            setState(() {});
                          });
                        },
                        child: Text('AÑADIR OFICIO')),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }

  Widget widOficios() {
    List<Widget> lista = [];
    List<Damage_Detail> listaDanos = [];
    oficios.forEach((element) {
      print('oficio ' + element.oficio);
      listaDanos = [];
      element.danos.forEach((element2) {
        Damage_Detail dano = Damage_Detail(
            id: element2.id,
            guardar: guardar,
            borrar: borrar,
            dano: element2.dano,
            medidas: element2.medidas);
        listaDanos.add(dano);
        print('se agrega dano ' + element2.dano + ' a ' + element.oficio);
      });

      lista.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Job(
          id: element.id,
          guardar: guardar,
          borrar: borrar,
          oficio: element.oficio,
          danos: listaDanos,
        ),
      ));
      print('(stay) se agrega oficio ' + element.oficio);
    });

    return Column(
      children: lista,
    );
  }

  borrar(int id) {
    //print("id: " + id.toString());
    int index = 0;

    for (int i = 0; i < ids; i++) {
      if (oficios[i].id == id) {
        //print(estancias[i].id.toString() + " ?? " + id.toString() + ' i=$i');
        index = i;
        break;
      }
    }
    //print('borrar $index');
    oficios.removeAt(index);

    setState(() {
      //print(estancias.length);
    });
  }

  _textoEstancia(String dropdownvalue) {
    String accion = 'OCULTAR';
    if (estancia) {
      accion = 'OCULTAR';
    } else {
      accion = 'MOSTRAR';
    }

    String textoBoton = '';
    if (dropdownvalue == '- Seleccione estancia -') {
      textoBoton = '$accion ESTANCIA';
    } else {
      textoBoton = '$accion ' + dropdownvalue.toUpperCase();
    }
    return textoBoton;
  }

  void cargarDatos() {
    //print('');
    if (widget.estancia != '') {
      dropdownvalue = widget.estancia;
      oficios = widget.oficios;
    }
    //_controllerAncho.text = widget.ancho;
    //_controllerLargo.text = widget.largo;
  }

  guardar(Job oficio) {
    print('guardar oficio ' + oficio.oficio);
    int index = 0;
    for (int i = 0; i < ids; i++) {
      if (oficios[i].id == oficio.id) {
        index = i;
        break;
      }
    }

    print('index $index  oficio id ' + oficio.id.toString());
    oficios[index] = oficio;
    widget.oficios = oficios;
    setState(() {
      widget.guardar(widget);
    });
  }
}
