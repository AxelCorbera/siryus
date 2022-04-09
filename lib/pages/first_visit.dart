import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/functions/message_snack.dart';
import 'package:fixapp/objects/file.dart';
import 'package:fixapp/objects/obj_settlement.dart';
import 'package:fixapp/widget/first_visit/damage_insure.dart';
import 'package:fixapp/widget/first_visit/injured.dart';
import 'package:fixapp/widget/first_visit/injured2.dart';
import 'package:fixapp/widget/first_visit/job.dart';
import 'package:fixapp/widget/first_visit/stay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../globals.dart';
import 'home.dart';

class First_Visit extends StatefulWidget {
  First_Visit({required this.expediente});
  final File expediente;
  _First_VisitState createState() => _First_VisitState();
}

class _First_VisitState extends State<First_Visit> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  int idPerjudicados = 0;
  String fechaStr = '';
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  DateTime fecha = DateTime.now();
  String dropdownvalue = '- Seleccionar partida -';
  bool _posibleFraude = false;
  String unidades = '';
  String importe = '';
  bool danos = false;
  Damage_Insure _damage_insure = Damage_Insure();
  List<bool> injureds = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  late Injured _injured1;
  late Injured _injured2;
  late Injured _injured3;
  late Injured _injured4;
  late Injured _injured5;
  late Injured _injured6;
  late Injured _injured7;
  late Injured _injured8;
  late Injured _injured9;
  late Injured _injured10;
  List<Injured> _listaPerjudicados = [];
  String estanciasStr = '';

  @override
  void initState() {
    _damage_insure = Damage_Insure();
    _listaPerjudicados = [];
    _injured1 = Injured(
        id: 0,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
    _injured2 = Injured(
        id: 1,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
    _injured3 = Injured(
        id: 2,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
    _injured4 = Injured(
        id: 3,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
    _injured5 = Injured(
        id: 4,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
    _injured6 = Injured(
        id: 5,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
    _injured7 = Injured(
        id: 6,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
    _injured8 = Injured(
        id: 7,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
    _injured9 = Injured(
        id: 8,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
    _injured10 = Injured(
        id: 9,
        borrar: borrarPerjudicado,
        guardar: guardarPerjudicado,
        direccion: '',
        nombre: '',
        telefono: '',
        estancias: []);
  }

  Widget build(BuildContext context) {
    _cambiarFecha(null);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colores.background,
          actions: [
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                enviar();
                setState(() {});
                if (_keyForm.currentState!.validate()) {
                  File exp = widget.expediente;
                  Comment comment = Comment(date: DateTime.now(),
                      author: user, message: estanciasStr, read: false);
                  exp.comments.add(comment);
                  exp.first_visit = true;
                  Message_Snack m = Message_Snack(context: context);
                  m.msg('Comentario enviado correctamente');
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/File', (Route<dynamic> route) => route is Home,arguments: exp);
                }
              },
            ),
          ],
          title: Text('Primera visita'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Form(
                key: _keyForm,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      controller: _controller1,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Origen de la avería',
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
                          value: _posibleFraude,
                          onChanged: (value) {
                            setState(() {
                              _posibleFraude = !_posibleFraude;
                            });
                          }),
                      Text('Posible fraude o rehuse'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      controller: _controller2,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Reparación realizada',
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      controller: _controller3,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Antigüedad aprox. vvda.',
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      controller: _controller4,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Notas libres',
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
                  _damage_insure,
                  //perjudicados(),
                  if (injureds[0]) _injured1,
                  if (injureds[1]) _injured2,
                  if (injureds[2]) _injured3,
                  if (injureds[3]) _injured4,
                  if (injureds[4]) _injured5,
                  if (injureds[5]) _injured6,
                  if (injureds[6]) _injured7,
                  if (injureds[7]) _injured8,
                  if (injureds[8]) _injured9,
                  if (injureds[9]) _injured10,
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          activarPerjudicado();
                          //crearPerjudicado();
                        },
                        child: Text('AÑADIR PERJUDICADO')),
                  ),
                  // Container(
                  //     alignment:Alignment.centerLeft,
                  //     child: Text(estanciasStr)),
                ]),
              ),
            ),
          ),
        ));
  }

  void enviar() {
    estanciasStr = '';
    String oficiosStr = '';
    String damageStr = '';

    String estanciasPerStr = '';
    String juntarStr = '';
    String oficiosPerStr = '';
    String damagePerStr = '';
    String nombre = '';

    String viviendaPer = '';
    String nombrePer = '';
    String telefonoPer = '';

    List<Stay> estancias = _damage_insure.estancias;
    List<Stay> estanciasPerjudicado = [];
    int i=0;
    int j=1;
    injureds.forEach((element) {
      estanciasPerStr = '';
      oficiosPerStr = '';
      damagePerStr = '';
      nombre= 'PERJUDICADO ';
      viviendaPer = '';
      nombrePer = '';
      telefonoPer = '';
      estanciasPerjudicado = [];
      if(element){
          switch (i) {
            case 0:
              estanciasPerjudicado = _injured1.estancias;
              viviendaPer = _injured1.direccion;
              nombrePer = _injured1.nombre;
              telefonoPer = _injured1.telefono;
              break;
            case 1:
              estanciasPerjudicado = _injured2.estancias;
              viviendaPer = _injured2.direccion;
              nombrePer = _injured2.nombre;
              telefonoPer = _injured2.telefono;
              break;
            case 2:
              estanciasPerjudicado = _injured3.estancias;
              viviendaPer = _injured3.direccion;
              nombrePer = _injured3.nombre;
              telefonoPer = _injured3.telefono;
              break;
            case 3:
              estanciasPerjudicado = _injured4.estancias;
              viviendaPer = _injured4.direccion;
              nombrePer = _injured4.nombre;
              telefonoPer = _injured4.telefono;
              break;
            case 4:
              estanciasPerjudicado = _injured5.estancias;
              viviendaPer = _injured5.direccion;
              nombrePer = _injured5.nombre;
              telefonoPer = _injured5.telefono;
              break;
            case 5:
              estanciasPerjudicado = _injured6.estancias;
              viviendaPer = _injured6.direccion;
              nombrePer = _injured6.nombre;
              telefonoPer = _injured6.telefono;
              break;
            case 6:
              estanciasPerjudicado = _injured7.estancias;
              viviendaPer = _injured7.direccion;
              nombrePer = _injured7.nombre;
              telefonoPer = _injured7.telefono;
              break;
            case 7:
              estanciasPerjudicado = _injured8.estancias;
              viviendaPer = _injured8.direccion;
              nombrePer = _injured8.nombre;
              telefonoPer = _injured8.telefono;
              break;
            case 8:
              estanciasPerjudicado = _injured9.estancias;
              viviendaPer = _injured9.direccion;
              nombrePer = _injured9.nombre;
              telefonoPer = _injured9.telefono;
              break;
            case 9:
              estanciasPerjudicado = _injured10.estancias;
              viviendaPer = _injured10.direccion;
              nombrePer = _injured10.nombre;
              telefonoPer = _injured10.telefono;
              break;
          }
      }

      estanciasPerjudicado.forEach((element) {
        element.oficios.forEach((element2) {
          element2.danos.forEach((element3) {
            damagePerStr =
                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t- Daño: ' +
                    element3.dano +
                    '\n' +
                    '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t- Medida de daños: ' +
                    element3.medidas +
                    '\n';
          });
          oficiosPerStr =
              '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t>' +
              element2.oficio +
              '\n' +
              damagePerStr;
        });
        estanciasPerStr = '\n' + estanciasPerStr +
            'Estancias:\n' +
            '\t\t\t\t> ' +
            element.estancia +
            ': ' +
            element.ancho +
            'x' +
            element.largo +
            'm2\n' +
            '\t\t\t\t\t\t\t\t\t\t\t\t- Oficios:\n' +
            oficiosPerStr;
        print(estanciasPerStr);
      });

      if(oficiosPerStr.isNotEmpty){
        String str = nombre+'$j:'+'\n'+
            'Vivienda: '+viviendaPer+'\n'+
            'Nombre: '+nombrePer+'\n'+
            'Teléfono: '+telefonoPer
            +estanciasPerStr;
      juntarStr = juntarStr +'\n' + str;
      j++;
      }
      oficiosPerStr ='';

      i++;
    });

    estancias.forEach((element) {
      element.oficios.forEach((element2) {
        element2.danos.forEach((element3) {
          damageStr =
              '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t- Daño: ' +
                  element3.dano +
                  '\n' +
                  '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t- Medida de daños: ' +
                  element3.medidas +
                  '\n';
        });
        oficiosStr =
            '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t>' +
            element2.oficio +
            '\n' +
            damageStr;
      });
      estanciasStr = estanciasStr +
          'Estancias:\n' +
          '\t\t\t\t> ' +
          element.estancia +
          ': ' +
          element.ancho +
          'x' +
          element.largo +
          'm2\n' +
          '\t\t\t\t\t\t\t\t\t\t\t\t- Oficios:\n' +
          oficiosStr;
    });
    String fraude='';
    if(_posibleFraude){
      fraude = 'Es un posible frause o rehuse';
    }else{
      fraude = 'No es un posible frause o rehuse';
    }
    String datosLugar = 'Origen: '+_controller1.text+'\n'+
        fraude+'\n'+
        _controller2.text+'\n'
        'Antigüedad: '+_controller3.text+'\n';
    estanciasStr = datosLugar+'\nASEGURADO:\n'+estanciasStr;

    estanciasStr = estanciasStr + '\n'+
        juntarStr+
        '\n- Notas: ' + _controller4.text;

    print(estanciasStr);
  }

  void activarPerjudicado() {
    for (int i = 0; i < injureds.length; i++) {
      if (injureds[i] == false) {
        injureds[i] = true;
        break;
      }
    }
    setState(() {});
  }

  void crearPerjudicado() {
    Injured injured = Injured(
      id: idPerjudicados,
      borrar: borrarPerjudicado,
      nombre: '',
      guardar: guardarPerjudicado,
      estancias: [],
      direccion: '',
      telefono: '',
    );
    _listaPerjudicados.add(injured);
    idPerjudicados++;
    setState(() {});
  }

  void borrarPerjudicado(Injured perjudicado) {
    // int index = 0;
    //
    // for (int i = 0; i < idPerjudicados; i++) {
    //   if (_listaPerjudicados[i].id == perjudicado.id) {
    //     index = i;
    //     break;
    //   }
    // }
    // print('borrar a ' + perjudicado.nombre);
    // _listaPerjudicados.removeAt(index);
    // print('quedan ' + _listaPerjudicados.length.toString());

    switch (perjudicado.id) {
      case 0:
        _injured1 = Injured(
            id: 0,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[0] = false;
        break;
      case 1:
        _injured2 = Injured(
            id: 1,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[1] = false;
        break;
      case 2:
        _injured3 = Injured(
            id: 2,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[2] = false;
        break;
      case 3:
        _injured4 = Injured(
            id: 3,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[3] = false;
        break;
      case 4:
        _injured5 = Injured(
            id: 4,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[4] = false;
        break;
      case 5:
        _injured6 = Injured(
            id: 5,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[5] = false;
        break;
      case 6:
        _injured1 = Injured(
            id: 6,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[6] = false;
        break;
      case 7:
        _injured1 = Injured(
            id: 7,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[7] = false;
        break;
      case 8:
        _injured1 = Injured(
            id: 8,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[8] = false;
        break;
      case 9:
        _injured1 = Injured(
            id: 9,
            borrar: borrarPerjudicado,
            guardar: guardarPerjudicado,
            direccion: '',
            nombre: '',
            telefono: '',
            estancias: []);
        injureds[9] = false;
        break;
    }

    setState(() {});
  }

  void guardarPerjudicado(Injured perjudicado) {
    // int index = 0;
    //
    // for (int i = 0; i < idPerjudicados; i++) {
    //   if (_listaPerjudicados[i].id == perjudicado.id) {
    //     index = i;
    //     break;
    //   }
    // }
    // print('guardar ' + perjudicado.nombre);

    switch (perjudicado.id) {
      case 0:
        _injured1 = perjudicado;
        break;
      case 1:
        _injured2 = perjudicado;
        break;
      case 2:
        _injured3 = perjudicado;
        break;
      case 3:
        _injured4 = perjudicado;
        break;
      case 4:
        _injured5 = perjudicado;
        break;
      case 5:
        _injured6 = perjudicado;
        break;
      case 6:
        _injured7 = perjudicado;
        break;
      case 7:
        _injured8 = perjudicado;
        break;
      case 8:
        _injured9 = perjudicado;
        break;
      case 9:
        _injured10 = perjudicado;
        break;
    }
    //_listaPerjudicados[index] = perjudicado;
    setState(() {});
  }

  Widget perjudicados() {
    print('rebuild');
    List<Injured> listaP = [];
    List<Stay> listaEstancias = [];

    _listaPerjudicados.forEach((element) {
      listaEstancias = [];
      element.estancias.forEach((element2) {
        Stay _estancia = Stay(
          id: element2.id,
          estancia: element2.estancia,
          ancho: element2.ancho,
          largo: element2.largo,
          oficios: element2.oficios,
          borrar: element2.borrar,
          guardar: element2.guardar,
          actualizar: element2.actualizar,
        );
        listaEstancias.add(_estancia);
        print('se agrega dano ' + element2.estancia + ' a ' + element.nombre);
      });

      print(element.nombre);
      Injured injured = Injured(
        id: element.id,
        borrar: borrarPerjudicado,
        nombre: element.nombre,
        guardar: guardarPerjudicado,
        estancias: element.estancias,
        direccion: element.direccion,
        telefono: element.telefono,
      );
      listaP.add(injured);
    });
    return Column(
      children: listaP,
    );
  }

  void actualizar() {
    print('asdasd');
    setState(() {});
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
