import 'package:app_perguntas/resultado.dart';
import 'package:flutter/material.dart';
import 'questionario.dart';

main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  @override
  State<PerguntasApp> createState() => _PerguntasAppState();
}

var _perguntaSelecionada = 0;
int _pontuacao = 0;

class _PerguntasAppState extends State<PerguntasApp> {
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 5},
        {'texto': 'Coelho', 'pontuacao': 3},
        {'texto': 'Cobra', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual sua futa favorita?',
      'respostas': [
        {'texto': 'Banana', 'pontuacao': 10},
        {'texto': 'Maça', 'pontuacao': 5},
        {'texto': 'Pera', 'pontuacao': 3},
        {'texto': 'Uva', 'pontuacao': 1},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacao += pontuacao;
      });
    }
  }

  void reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacao = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //esta forma de criar wigets acima, é chamada de funcional, reduz mais as linhas e com
    //menos verbosidade.

    //  for (var textoResp in respostas) {
    //   widgets.add(Resposta(textoResp.toString(), _responder));
    //}

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas App'),
            centerTitle: true,
          ),
          body: temPerguntaSelecionada
              ? Column(
                  children: [
                    Questionario(
                      perguntas: _perguntas,
                      perguntaSelecionada: _perguntaSelecionada,
                      quandoResponder: _responder,
                    ),
                  ],
                )
              : Resultado(_pontuacao, reiniciarQuestionario)),
    );
  }
}
