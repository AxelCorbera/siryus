import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart';

class Agenda extends StatefulWidget {
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: expedientes.length,
            itemBuilder: (context, index){
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(expedientes[index].number_file,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                            Text(expedientes[index].address),
                            Text(expedientes[index].postal_code+' ('+ expedientes[index].city +')'),
                          Text('Cita: ' +
                          DateTime.parse(expedientes[index].limit_time).hour.toString()+':'+
                              DateTime.parse(expedientes[index].limit_time).minute.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                            Text('(' +
                                DateTime.parse(expedientes[index].limit_time).day.toString()+'/'+
                                DateTime.parse(expedientes[index].limit_time).month.toString()+'/'+
                                DateTime.parse(expedientes[index].limit_time).year.toString()+')',
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
          );
        }),
      ],
    );
  }

}