import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/pages/sync_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../globals.dart';

class Create_Code extends StatefulWidget {
  _Create_CodeState createState() => _Create_CodeState();
}

class _Create_CodeState extends State<Create_Code> {
  bool _passwordVisible = false;
  final _keyform = GlobalKey<FormState>();
  int codigo= 0;
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.background,
        title: Text("Crear código de bloqueo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/test.jpg'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Form(
                    key: _keyform,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colores.gris,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                keyboardType: TextInputType.number,
                                obscureText: _passwordVisible
                                    ?false:true,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).primaryColor
                                  ),
                                  labelText: 'Codigo',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                      height: 0.2,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                onChanged: (value){
                                  codigo = int.parse(value.toString());
                                },
                                validator: (value){
                                  if(value!.isEmpty)
                                    return "Debe ingresar un codigo";
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(onPressed: (){
                                if(_keyform.currentState!.validate()){
                                  code = codigo;
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => Sync_Up()),
                                        (Route<dynamic> route) => false,
                                  );
                                }
                              },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.resolveWith((states) => Colores.gris)
                                ),
                                child: Text(
                                  'ENTRAR',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),),
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
