import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static const pedra =0;
  static const papel =1;
  static const tesoura =2;

  var _imagemApp = AssetImage("imgs/padrao.png");
  var _textoApp = "Escolha uma opção abaixo:";

  void Jogar(int minhaEscolha){

   setState(() {
     var escolha = Random().nextInt(3);

     _textoApp = "Empatou";
     if(escolha == papel){
       _imagemApp = AssetImage("imgs/papel.png");
       if(minhaEscolha == pedra){
         _textoApp = "Você perdeu";
       }
       else if(minhaEscolha == tesoura){
         _textoApp = "Você ganhou";
       }
     }
     else if(escolha == pedra){
       _imagemApp = AssetImage("imgs/pedra.png");
       if(minhaEscolha == papel){
         _textoApp = "Você ganhou";
       }
       else if(minhaEscolha == tesoura){
         _textoApp = "Você perdeu";
       }
     }
     else if(escolha == tesoura){
       _imagemApp = AssetImage("imgs/tesoura.png");
       if(minhaEscolha == papel){
         _textoApp = "Você perdeu";
       }
       else if(minhaEscolha == pedra){
         _textoApp = "Você ganhou";
       }
     }
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JokenPo",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text("Escolha do App:"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Image(image: _imagemApp),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(_textoApp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset("imgs/pedra.png",height: 90),
                    onPressed: () => Jogar(pedra),
                ),
                IconButton(
                    onPressed: () => Jogar(papel),
                    icon: Image.asset("imgs/papel.png",height: 90)
                ),
                IconButton(
                    onPressed: () =>Jogar(tesoura),
                    icon: Image.asset("imgs/tesoura.png",height: 90)
                )
              ],

            )
          ],
        ),
      ),
    );
  }
}





