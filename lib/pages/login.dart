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
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/test.jpg'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,100,0,30),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/logo2.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Form(
                    key: _keyform,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).primaryColor
                                  ),
                                  labelText: 'Reparador',
                                  labelStyle: TextStyle(
                                      height: 1
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blueAccent),
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                obscureText: _passwordVisible
                                    ?false:true,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).primaryColor
                                  ),
                                  labelText: 'Contraseña',
                                  labelStyle: TextStyle(
                                    height: 0.2
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
                                      color: Theme.of(context).primaryColorDark,
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
                              child: RaisedButton(onPressed: (){
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
                                color: Theme.of(context).primaryColor,
                                child: Text(
                                  'ENTRAR',
                                  style: TextStyle(
                                      color: Theme.of(context).secondaryHeaderColor
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
