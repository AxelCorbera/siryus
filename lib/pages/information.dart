import 'package:fixapp/constants/themes.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
        backgroundColor: Colores.background,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.1,
              child: Text('Para el correcto funcionamiento del sistema de notificaciones, en algunos dispositivos el gestor de batería impide la llegada de notificaciones cuando la aplicación se encuentra cerrada o en segundo plano. Para evitarlo, es necesario acceder a los ajustes de batería y deshabilitar el ahorro de energía para Fixapp.',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 20
              ),),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.1,
              child: Text('Por ejemplo en un dispositivo Huawei: Ajustes -> Ajustes avanzados -> Gestor de batería -> Aplicaciones protegidas.',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
