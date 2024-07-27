import 'package:flutter/material.dart';

class Camposwitch extends StatefulWidget {
  const Camposwitch({super.key});

  @override
  State<Camposwitch> createState() => _CamposwitchState();
}

class _CamposwitchState extends State<Camposwitch> {

  bool _valorSelecionado = false;

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
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Switch(
                value: _valorSelecionado,
                onChanged: (bool escolha){
                  setState(() {
                    _valorSelecionado = escolha;
                  });
                }
            ),
            Text("Receber notificações? "),
            TextButton(
                onPressed: (){
                  print(_valorSelecionado);
                },
                child: Text("Enviar")
            )
          ],
        ),
      ),
    );
  }
}
