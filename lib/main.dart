import 'package:camera/camera.dart';
import 'package:fixapp/objects/file.dart';
import 'package:fixapp/pages/new_action.dart';
import 'package:fixapp/pages/change_code.dart';
import 'package:fixapp/pages/create_code.dart';
import 'package:fixapp/pages/file_page.dart';
import 'package:fixapp/pages/home.dart';
import 'package:fixapp/pages/information.dart';
import 'package:fixapp/pages/login.dart';
import 'package:fixapp/pages/maps.dart';
import 'package:fixapp/pages/sign_contract.dart';
import 'package:fixapp/pages/start_repair.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'components/camera_video.dart';
import 'constants/themes.dart';
import 'globals.dart';

Future<void> main() async {


  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    scaffoldKeyGlobal = scaffoldKey;
    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: temaUno,
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (BuildContext context) {
        switch (settings.name) {
          case "/Login":
            return Login();
          case "/Home":
            return Home();
          case "/Create_Code":
            return Create_Code();
          case "/Information":
            return Information();
          case "/Change_Code":
            return Change_Code();
          case "/Maps":
            final args = settings.arguments as CameraPosition;
            return Maps(lugar: args,);
          case "/File":
            final args = settings.arguments as File;
            return File_Page(args);
          case "/Start_Repair":
            var args = settings.arguments as File;
            return Start_Repair(expediente: args,);
          case "/New_Action":
            var args = settings.arguments as File;
            return New_Action(expediente: args);
          case "/Sign_Contract":
            var args = settings.arguments as File;
            return Sign_Contract(expediente: args,);
          default:
            return Login();
        }
      });
    },
    );
  }
}
