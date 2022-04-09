import 'package:camera/camera.dart';
import 'package:fixapp/objects/file.dart';
import 'package:flutter/material.dart';

int code = 0;
String user = "";
String pass = "";
bool avisos = false;
List<File> expedientes = [];
List<CameraDescription> cameras = <CameraDescription>[];
GlobalKey<ScaffoldMessengerState> scaffoldKeyGlobal = GlobalKey<ScaffoldMessengerState>();