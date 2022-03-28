import 'package:fixapp/pages/change_code.dart';
import 'package:fixapp/pages/create_code.dart';
import 'package:fixapp/pages/information.dart';
import 'package:fixapp/pages/login.dart';
import 'package:flutter/material.dart';

import 'constants/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: temaUno,
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (BuildContext context) {
        switch (settings.name) {
          case "/Home":
            return Login();
          case "/Create_Code":
            return Create_Code();
          case "/Information":
            return Information();
          case "/Change_Code":
            return Change_Code();
          default:
            return Login();
        }
      });
    },
    );
  }
}
