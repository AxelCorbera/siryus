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
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Sincronización"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.8,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/images/sync_up.jpg'),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Recibiendo datos...",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (Route<dynamic> route) => false,
                  );
                },
                color: Theme.of(context).primaryColor,
                child: Text(
                  'CONTINUAR',
                  style:
                      TextStyle(color: Theme.of(context).secondaryHeaderColor),
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
        date: DateTime.now().toString(),
        author: "JUAN PEREZ",
        message: "tuberias averiadas",
        read: false);

    File exp = File(
        name_company: "COMPAÑIA1",
        type: "asegurado",
        number_file: "123456-70/123123/2022",
        holder: "TITULAR1",
        address: "Malasaña 32",
        postal_code: "12345",
        city: "Madrid",
        f_phone: "654123123",
        s_phone: "",
        status: "Pendiente de contactar",
        limit_time: DateTime.now().add(const Duration(days: 5)).toString(),
        comments: [comentario],
        settlement: "");
    expedientes.add(exp);
  }
}
