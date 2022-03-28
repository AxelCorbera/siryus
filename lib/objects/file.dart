import 'dart:core';

class File{
  String name_company;
  String type;
  String number_file;
  String holder;
  String address;
  String postal_code;
  String city;
  String f_phone;
  String s_phone;
  String status;
  String limit_time;
  List<Comment> comments;
  String settlement;

  File({required this.name_company,
  required this.type,
  required this.number_file,
  required this.holder,
  required this.address,
  required this.postal_code,
  required this.city,
  required this.f_phone,
  required this.s_phone,
  required this.status,
  required this.limit_time,
  required this.comments,
  required this.settlement});
}

class Comment{
  String date;
  String author;
  String message;
  bool read;
  Comment({required this.date,
  required this.author,
  required this.message,
  required this.read});

}
