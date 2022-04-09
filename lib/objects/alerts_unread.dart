import 'package:fixapp/objects/file.dart';

class Alerts_Unread{
  Alerts_Unread({required this.expediente,required this.mensajes});
  final File expediente;
  final List<Comment> mensajes;
}