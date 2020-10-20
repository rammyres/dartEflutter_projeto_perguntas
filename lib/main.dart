import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/questionario.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  // This widget is the root of your application.
  int _perguntaSelecionada = 0;
  var _pontucao = 0;

  final _perguntas = const [
    {
      "texto": "Qual sua cor favorita?",
      "respostas": [
        {"texto": "Amarelo", "pontos": 5},
        {"texto": "Azul", "pontos": 10},
        {"texto": "Verde", "pontos": 8},
        {"texto": "Branco", "pontos": 6},
      ]
    },
    {
      "texto": "Qual sua animal favorito?",
      "respostas": [
        {"texto": "Gato", "pontos": 8},
        {"texto": "Papagaio", "pontos": 2},
        {"texto": "Cachorro", "pontos": 8},
        {"texto": "Peixe", "pontos": 10}
      ]
    },
    {
      "texto": "Qual seu numero?",
      "respostas": [
        {"texto": "11", "pontos": 8},
        {"texto": "24", "pontos": 4},
        {"texto": "33", "pontos": 9},
        {"texto": "42", "pontos": 7}
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontucao += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontucao = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
              )
            : Resultado(_pontucao, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
