import 'package:flutter/material.dart';

class TelaClientes extends StatefulWidget {
  const TelaClientes({super.key});

  @override
  State<TelaClientes> createState() => _TelaClientesState();
}

class _TelaClientesState extends State<TelaClientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
            "Clientes",
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
                    child: Image.asset("imgs/detalhe_cliente.png"),
                  ),
                  Text(
                    "Clientes",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Image.asset("imgs/cliente1.png")
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Image.asset("imgs/cliente2.png")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
