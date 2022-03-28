
import 'package:flutter/material.dart';

class Colores{
  static final Color background = Color(0xff35424c);
  static final Color gris = Color(0xff48535c);

}

final ThemeData temaUno = ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.white),
      headline6: TextStyle( color: Colors.white),
      bodyText1:
      TextStyle( color: Colors.white),
    ),
    primaryColor: Colors.white,
    secondaryHeaderColor: Colors.grey,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    //canvasColor: Colores.azulOscuro,
    primaryColorLight: Colors.white,
    focusColor: Colors.white,
    hoverColor: Colors.white,
    hintColor: Colors.white,
    cursorColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
       color: Colors.white
      ),
      filled: true,
      fillColor: Colores.gris,
      focusColor: Colores.gris,
      labelStyle: TextStyle(
        color: Color(0xff02253d),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colores.gris,
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colores.gris,
          width: 2.0,
        ),
      ),

    ),
    colorScheme:
    ColorScheme.fromSwatch().copyWith(secondary: Colors.grey));
