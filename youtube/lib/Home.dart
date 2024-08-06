import 'package:flutter/material.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int indiceAtual=0;

  List<Widget> telas = [
    Inicio(),
    Inscricao(),
    EmAlta()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube"),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.videocam)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.account_circle)
          )
        ],
      ),
      body:   telas[indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceAtual,
        onTap: (indice){
          setState(() {
            indiceAtual = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot),
              label: "Em alta"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Inscrições"
          ),
        ],
      ),
    );
  }
}
