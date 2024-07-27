import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _alcool = new TextEditingController();
  TextEditingController _gasolina = new TextEditingController();
  var _resultado = "";

  void Calcular(){

    var gasolinaNum = _gasolina.text.replaceAll(',', '.');
    var alcoolNum = _alcool.text.replaceAll(',', '.');

    var gasolinaAux = double.parse(gasolinaNum) * 0.7;

    setState(() {

      if(gasolinaAux > double.parse(alcoolNum)){
        _resultado = "Alcool compensa mais";
      }else if(gasolinaAux < double.parse(alcoolNum)){
        _resultado = "Gasolina compensa mais";
      }
      else{
        _resultado = "Tanto faz";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
            "Álcool ou gasolina",
            style: TextStyle(
              color: Colors.white
            ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Image.asset("imgs/logo.png"),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    "Saiba qual a melhor opção para o abastecimento do seu carro",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59",
                  ),
                  keyboardType: TextInputType.number,
                  controller: _alcool,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 1.59",
                  ),
                  keyboardType: TextInputType.number,
                  controller: _gasolina,
                ),
              ),
              TextButton(
                onPressed: () => Calcular(),
                child: Text("Calcular"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightGreen
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(_resultado),
              )
            ],
          ),
        )
      ),
    );
  }
}

