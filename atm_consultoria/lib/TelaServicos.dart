import 'package:flutter/material.dart';

class TelaServicos extends StatefulWidget {
  const TelaServicos({super.key});

  @override
  State<TelaServicos> createState() => _TelaServicosState();
}

class _TelaServicosState extends State<TelaServicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
            "Serviços",
            style: TextStyle(
                color: Colors.white
            )
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Image.asset("imgs/detalhe_servico.png"),
                  ),
                  Text(
                    "Nossos serviços",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "Consultoria"
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                    "Preços"
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                    "Acompanhamento de projetos"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
