import 'package:flutter/material.dart';
import 'package:navegacao/main.dart';

class SegundaTela extends StatefulWidget {

  static const routeName = '/secundaria';

  String? valor;
  //Parametro opcional
  SegundaTela([this.valor]);


  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as SegundaTela;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tela secundária"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            Text("Segunda tela ${args.valor}")
          ],
        ),
      ),
    );
  }
}
