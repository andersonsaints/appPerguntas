import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  String respostaTxt;
  void Function() funcao;

  Resposta(this.respostaTxt, this.funcao);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: funcao,
          child: Text(respostaTxt),
        ));
  }
}
