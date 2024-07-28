import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _valor = "";

  void RecuperarPreco() async{
    String url = "https://blockchain.info/ticker";

    http.Response response;

    response = await http.get(Uri.parse(url));

    Map<String,dynamic> retorno = json.decode(response.body);

    print(retorno["BRL"]["buy"]);

    setState(() {
      _valor = retorno["BRL"]["buy"].toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "imgs/bitcoin.png",
              height: 60,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(_valor),
            ),

            TextButton(
                onPressed: () => RecuperarPreco(),
                child: Text("Aperte aqui!")
            )
          ],
        ),
      ),
    );
  }
}
