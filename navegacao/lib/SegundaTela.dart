import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {

  String? valor;
  //Parametro opcional
  SegundaTela([this.valor]);


  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela secundária"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            Text("Segunda tela ${widget.valor}")
          ],
        ),
      ),
    );
  }
}
