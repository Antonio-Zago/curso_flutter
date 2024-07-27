import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Entrada de dados",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Container(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Digite um valor: "
                ),
                enabled: true,
                maxLength: 10,
                style: TextStyle(
                  color: Colors.red
                ),
                controller: _controller,
              ),
              TextButton(
                  onPressed: (){
                    print("valor digitado: " + _controller.text);
                  },
                  child: Text("Enviar"),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
