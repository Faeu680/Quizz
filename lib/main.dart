import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

main(){
  runApp(PerguntaApp());
}
class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;

  void _responder(){
    if (_temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada ++;
      });
    }
  }

  final List<Map <String, dynamic>> _perguntas = const[
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Preto','Vermelho','Verde','Branco']
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': ['Coelho','Cobra','Leão','Onça']
    },
    {
      'texto': 'Qual sua comida favorito?',
      'respostas': ['Carne','Doces','Massas','Salgadinho']
    },
  ];

  bool get _temPerguntaSelecionada{
    return _perguntaSelecionada <  _perguntas.length;
  }

  @override
  Widget build(BuildContext context){
    List <String> respostas = _temPerguntaSelecionada? _perguntas[_perguntaSelecionada]['respostas'] : null;
    List <Widget> widgets = respostas
          .map((t) => Resposta(t,_responder))
          .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: _temPerguntaSelecionada ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntaSelecionada]['texto']),
            ...widgets,
          ],
        ) : Center(
          child: Text(
            'Parabéns!',
            style: TextStyle(
              fontSize: 28
            ),
          ),
        )
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}