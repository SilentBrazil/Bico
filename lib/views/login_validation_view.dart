import 'package:bico/components/appbar_custom.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

class LoginValidationView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final String telefone;

  LoginValidationView({Key key, this.telefone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Insira seu código de 4 dígitos enviado para "${telefone}"',
                  style: TextStyle(
                    color: Color.fromRGBO(45, 45, 45, 50),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor),
                    ),
                    counterText: "",
                    labelText: "Código",
                    hintText: "0000",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    print(value.length);
                    if (value.isEmpty) {
                      return 'Código Inválido';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Não recebi o código',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          /*Navigator. pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
          )*/
          Navigator. push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
          );

          }
        },
        tooltip: 'next',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
