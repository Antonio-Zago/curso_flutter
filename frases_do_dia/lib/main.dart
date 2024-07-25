import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
      home: Home()
  )
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _texto = ["teste1","teste2", "teste3","teste4","teste5"];
  var _textoAtual = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
            "Frases do dia",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset(
                  "imgs/logo.png",
                ),
            Text(
                _textoAtual,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
             ElevatedButton(
                  onPressed: (){
                    setState(() {
                      var rng = Random();
                      _textoAtual = _texto[rng.nextInt(5)];
                    });
                  },
                  child: Text("Nova frase"),
                  style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(),
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.lightGreen
                  )
              ),
          ],
        ),
      ),
    );
  }
}



