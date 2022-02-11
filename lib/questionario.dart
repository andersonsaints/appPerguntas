import 'package:flutter/material.dart';
import 'resposta.dart';
import 'questao.dart';

class Questionario extends StatelessWidget {
  late final int perguntaSelecionada;
  late final List<Map<String, Object>> perguntas;
  late final void Function(int) quandoResponder;

  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.quandoResponder});

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        perguntas[perguntaSelecionada].cast()['respostas'];
    return Column(children: [
      Questao(perguntas[perguntaSelecionada].cast()['texto']),
      ...respostas
          .map((resp) => Resposta(resp['texto'].toString(), () {
                quandoResponder(int.parse(resp['pontuacao'].toString()));
              }))
          .toList(),
    ]);
  }
}
