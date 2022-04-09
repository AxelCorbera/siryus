import 'package:fixapp/constants/themes.dart';
import 'package:fixapp/globals.dart';
import 'package:flutter/material.dart';

import 'create_code.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  String usuario = '';
  String contra = '';
  final _keyform = GlobalKey<FormState>();
  Widget build(BuildContext) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            //color: Colores.background
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/background.jpg'),
                  fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,100,0,30),
                child: Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/logo3.png'),
                          fit: BoxFit.fill)
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/9,),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colores.background,
                        Colores.gris
                      ]
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: MediaQuery.of(context).size.height /1.726,
                child: Center(
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0,100,0,30),
                      //   child: Container(
                      //     height: MediaQuery.of(context).size.height / 7,
                      //     width: MediaQuery.of(context).size.width / 1.5,
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //             image: AssetImage('lib/assets/images/logo3.png'),
                      //             fit: BoxFit.fill)
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 30,),
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        child: Form(
                          key: _keyform,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colores.gris,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                        ),
                                        labelText: 'Reparador',
                                        labelStyle: TextStyle(
                                            height: 1,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        // focusedBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(color: Colors.white),
                                        //   borderRadius: BorderRadius.circular(10.0),
                                        // ),
                                        disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      onChanged: (value){
                                        usuario = value;
                                      },
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return "Este campo es obligatorio";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colores.gris,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      obscureText: _passwordVisible
                                          ?false:true,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color: Theme.of(context).primaryColor
                                        ),
                                        labelText: 'Contraseña',
                                        labelStyle: TextStyle(
                                          height: 0.2,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        // focusedBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(color: Colors.white),
                                        //   borderRadius: BorderRadius.circular(10.0),
                                        // ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _passwordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Theme.of(context).primaryColor,
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
                                        contra = value;
                                      },
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return "Este campo es obligatorio";
                                        }
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
                                      if(_keyform.currentState!.validate()) {
                                        user = usuario;
                                        pass = contra;
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Create_Code()),
                                              (Route<dynamic> route) => false,
                                        );
                                      }
                                    },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[600])
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
            ],
          ),
        ),
      ),
    );
  }
}
