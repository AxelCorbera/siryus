import 'package:fixapp/constants/themes.dart';
import 'package:flutter/material.dart';
import '../globals.dart';

class Message_Snack {


  void msg(String msg){
    showText(msg);
  }

  Message_Snack({required this.context});
  final BuildContext context;

  final ScaffoldMessengerState? _scaffold = scaffoldKeyGlobal.currentState;

  void showText(String texto){
    SnackBar sb = SnackBar(
      content: Text(
        texto,
        style: const TextStyle(
          fontSize: 16
        ),
        textAlign: TextAlign.center,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20),)),
      elevation: 6.0,
      backgroundColor: Colors.black54,
      behavior: SnackBarBehavior.floating,
      width: MediaQuery.of(context).size.width/2,
    );

    _scaffold?.showSnackBar(sb);
  }
}