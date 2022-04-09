import 'package:fixapp/objects/appointment_date.dart';
import 'package:fixapp/objects/file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../globals.dart';

class Agenda extends StatefulWidget {
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda>{
  List<Appointment_Date> listaCitas = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: _agenda());
  }

  Widget _agenda() {
    //listaCitas = [];
    List<DateTime> list = [];
    List<File> comment2 = [];
    expedientes.forEach((element) {
      list.add(DateTime.parse(element.limit_time));
    });
    list.sort((a, b) {
      return a.compareTo(b);
    });
    list.forEach((element) {
      for (int i = 0; i < list.length; i++) {
        if (element == DateTime.parse(expedientes[i].limit_time)) comment2.add(expedientes[i]);
      }
    });

    _calcularCitas(comment2);
    //listaCitas.forEach((element) { print(element.date); });

    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: comment2.length,
            itemBuilder: (context, index){

              DateTime date =DateTime.parse(comment2[index].limit_time);
              String cita = date.day.toString() + '/' +
                  date.month.toString() + '/' +
                  date.year.toString();
              int i = 0;
              bool existe = false;
              bool uso = false;
              for(int j = 0; j<listaCitas.length;j++) {
                  if (listaCitas[j].date == cita) {
                    if (listaCitas[j].uso) {
                      uso = true;
                      i=j;
                      break;
                    }else{
                      i=j;
                      break;
                    }
                  }
              }

              if(!uso) {
                listaCitas[i].uso =true;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,5,5,2),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 30,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(listaCitas[i].date,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Text('-'),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(listaCitas[i].amount==1?
                              listaCitas[i].amount.toString()+" cita":
                              listaCitas[i].amount.toString()+ " citas",
                                style: TextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('lib/assets/images/agenda.png'),
                                        fit: BoxFit.fill)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,4,8,4),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(comment2[index].number_file,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),),
                                      Text(comment2[index].address),
                                      Text(comment2[index].postal_code+' ('+ comment2[index].city +')'),
                                      Text('Cita: ' +
                                          DateTime.parse(comment2[index].limit_time).hour.toString()+':'+
                                          DateTime.parse(comment2[index].limit_time).minute.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),),
                                      Text('(' +
                                          DateTime.parse(comment2[index].limit_time).day.toString()+'/'+
                                          DateTime.parse(comment2[index].limit_time).month.toString()+'/'+
                                          DateTime.parse(comment2[index].limit_time).year.toString()+')',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed('/File',arguments: comment2[index]);
                      },
                    )
                  ],
                );
              }else{
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('lib/assets/images/agenda.png'),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,4,8,4),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(comment2[index].number_file,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                Text(comment2[index].address),
                                Text(comment2[index].postal_code+' ('+ comment2[index].city +')'),
                                Text('Cita: ' +
                                    DateTime.parse(comment2[index].limit_time).hour.toString()+':'+
                                    DateTime.parse(comment2[index].limit_time).minute.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                Text('(' +
                                    DateTime.parse(comment2[index].limit_time).day.toString()+'/'+
                                    DateTime.parse(comment2[index].limit_time).month.toString()+'/'+
                                    DateTime.parse(comment2[index].limit_time).year.toString()+')',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pushNamed('/File',arguments: comment2[index]);
                },
              );
              }
            })
      ],
    );
  }

  String find_date(String s) {
    int i = 0;
    String cita = '';
    listaCitas.forEach((element) {
      if(s == element.date){
        cita = element.amount.toString();
      }
      i++;
    });
    return cita;
  }

  void _calcularCitas(List<File> comment2) {
    listaCitas = [];
    bool existe = false;
    int i = 0;
    String cita= '';
    String citaAnterior= '';

    comment2.forEach((element) {
      DateTime date = DateTime.parse(element.limit_time);
      cita = date.day.toString() + '/' +
          date.month.toString() + '/' +
          date.year.toString();
      if(listaCitas.isEmpty) {
        Appointment_Date _appointment_date = Appointment_Date(
                  cita, 1,false);
        listaCitas.add(_appointment_date);
      }else{
        i=0;
        listaCitas.forEach((element) {
          if(element.date == cita){
            existe = true;
          }else{
          }
          i++;
        });
        if(existe){
          listaCitas[i-1].amount++;
          existe=false;
      }else{
          Appointment_Date _appointment_date = Appointment_Date(
              cita, 1,false);
          listaCitas.add(_appointment_date);
        }

    }
  });

}}