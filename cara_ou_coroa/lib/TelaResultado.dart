import 'package:cara_ou_coroa/TelaPrincipal.dart';
import 'package:flutter/material.dart';

class TelaResultado extends StatefulWidget {

  String valor;

  TelaResultado(this.valor);

  @override
  State<TelaResultado> createState() => _TelaResultadoState();
}

class _TelaResultadoState extends State<TelaResultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.lightGreen
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Image.asset("imgs/${widget.valor}"),
            ),
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Image.asset("imgs/botao_voltar.png")
            )
          ],
        ),
      ),
    );
  }
}
