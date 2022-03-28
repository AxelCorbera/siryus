import 'package:fixapp/pages/change_code.dart';
import 'package:fixapp/pages/create_code.dart';
import 'package:fixapp/pages/information.dart';
import 'package:fixapp/pages/login.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.blue[700],
        primarySwatch: Colors.blue,
      ),
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
