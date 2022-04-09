import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/globals.dart';
import 'package:fixapp/objects/file.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Sync_Up extends StatefulWidget {
  _Sync_UpState createState() => _Sync_UpState();
}

class _Sync_UpState extends State<Sync_Up> {
  @override
  void initState() {
    super.initState();
    crear_expedientes();
  }

  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.background,
        title: Text("Sincronización"),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 80,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  // decoration: BoxDecoration(
                  //   color: Colors.blue[700],
                  //   borderRadius: BorderRadius.circular(15),
                  //),
                  child: Icon(
                    Icons.wifi_protected_setup,
                    size: 70,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: MediaQuery.of(context).size.width / 2,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/images/logo3.png'),
                                fit: BoxFit.scaleDown))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Recibiendo datos...",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colores.gris)),
                child: Text(
                  'CONTINUAR',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void crear_expedientes() {
    Comment comentario = new Comment(
        date: DateTime.now(),
        author: "JUAN PEREZ",
        message: "tuberias averiadas",
        read: false);

    Comment comentario2 = new Comment(
        date: DateTime.now().add(Duration(hours: 1)),
        author: "JUAN PEREZ",
        message: "ASG INDICA QUE CREE QUE HAY"
            "UNA ROTURA DEL BOTE DEL CUARTO DE BAÑO"
            "Y PRODUCE HUMEDAD EN EL TECHO INFERIOR",
        read: false);

    Comment comentario3 = new Comment(
        date: DateTime.now(),
        author: "ANA JULIA",
        message: "manchas de humedad",
        read: false);

    Comment comentario4 = new Comment(
        date: DateTime.now().add(Duration(hours: 1)),
        author: "ANA JULIA",
        message: "ASG INDICA QUE CREE QUE HAY"
            "UNA FUGA DE AGUA EN LA PARED"
            "Y PRODUCE HUMEDAD EN EL TECHO INFERIOR",
        read: false);

    File exp = File(
        name_company: "COMPAÑIA1",
        type: "asegurado",
        number_file: "123456-70/123123/2022",
        holder: "TITULAR1",
        address: "Gran via 30",
        postal_code: "12345",
        city: "Madrid",
        f_phone: "654123123",
        s_phone: "",
        status: "Pendiente de contactar",
        limit_time: DateTime.now().add(const Duration(days: 5)).toString(),
        comments: [comentario, comentario2],
        settlement: [],
        date: DateTime.now().add(Duration(days: 10)),
        duration: 2,
        inicio: false,
        first_visit: false);
    expedientes.add(exp);
    exp = File(
        name_company: "COMPAÑIA2",
        type: "asegurado",
        number_file: "222222-70/333333/2022",
        holder: "TITULAR2",
        address: "Villanueva",
        postal_code: "12345",
        city: "Madrid",
        f_phone: "654123123",
        s_phone: "",
        status: "Pendiente de contactar",
        limit_time: DateTime.now().toString(),
        comments: [comentario3, comentario4],
        settlement: [],
        date: DateTime.now().add(Duration(days: 10)),
        duration: 2,
        inicio: false,
        first_visit: false);
    expedientes.add(exp);
  }
}
