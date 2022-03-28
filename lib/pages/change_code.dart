import 'package:flutter/material.dart';

import '../globals.dart';

class Change_Code extends StatefulWidget {
  _Change_CodeState createState() => _Change_CodeState();
}

class _Change_CodeState extends State<Change_Code> {
  bool _passwordVisible = false;
  final _keyform = GlobalKey<FormState>();
  int codigo = code;
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(onPressed: () {
          if(_keyform.currentState!.validate()){
            if(codigo != code) {
              code = codigo;
              Navigator.pop(context, true);
            }else{
              Navigator.pop(context, false);
            }
          }
        },
            icon: Icon(Icons.done))],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Text(
                user + ' - PRUEBA',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Text(
                'Código de bloque (4 dígitos)',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Form(
                key: _keyform,
                child: TextFormField(
                  initialValue: code.toString(),
                  keyboardType: TextInputType.number,
                  obscureText: _passwordVisible ? false : true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                    labelStyle: TextStyle(height: 0.2),
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
                  onChanged: (value) {
                    codigo = int.parse(value.toString());
                  },
                  validator: (value) {
                    if (value!.isEmpty) return "Debe ingresar un codigo";
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(value: avisos, onChanged: (value){
                  print(value);
                  setState(() {
                    avisos = value!;
                  });
                }),
                Text("Silenciar avisos")
              ],
            )
          ],
        ),
      ),
    );
  }

}
