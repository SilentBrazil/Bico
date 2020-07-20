import 'package:bico/views/login_validation_view.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _telefone = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+## (##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Insira seu número de celular",
                  style: TextStyle(
                    color: Color.fromRGBO(45, 45, 45, 50),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _telefone,
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.phone,
                  //initialValue: "+55",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        )),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    labelText: "Telefone",
                    hintText: "+55 (00)000-0000",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    //print(value.length);
                    if (value.isEmpty) {
                      return 'Telefone Inexistente';
                    } else if (value.length < 20) {
                      return 'Número Inválido';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Ao continuar, você pode recer um SMS para confrimação. Pode haver cobrança de taxas de envio de mensagens e dados",
                  style: TextStyle(fontSize: 12),
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
            print(_telefone.text);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginValidationView(
                          telefone: _telefone.text.replaceAll("+55 ", ""),
                        )));
          }
        },
        tooltip: 'next',
        child: Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
