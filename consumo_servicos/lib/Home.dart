import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  void RecuperarCep() async{
    String url = "https://viacep.com.br/ws/12235180/json/";

    http.Response response;

    response = await http.get(Uri.parse(url));

    Map<String,dynamic> retorno = json.decode(response.body);

    print(response.body);

    print(retorno["logradouro"]);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo serviço WEB"),
      ),
      body: Container(
        child: Column(
          children: [
            TextButton(
                onPressed: () => RecuperarCep(),
                child: Text("Clique aqui")
            )
          ],
        ),
      ),
    );
  }
}
