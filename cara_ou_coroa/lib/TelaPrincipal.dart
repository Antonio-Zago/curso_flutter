import 'dart:math';

import 'package:cara_ou_coroa/TelaResultado.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
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
                child: Image.asset("imgs/logo.png"),
            ),
            IconButton(
                onPressed: (){

                  int valor = Random().nextInt(2);
                  String caraCoroa;
                  if (valor == 1){
                    caraCoroa = "moeda_cara.png";
                  }
                  else{
                    caraCoroa = "moeda_coroa.png";
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaResultado(caraCoroa))
                  );
                },
                icon: Image.asset("imgs/botao_jogar.png")
            )
          ],
        ),
      ),
    );
  }
}
