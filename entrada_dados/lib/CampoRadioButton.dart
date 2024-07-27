import 'package:flutter/material.dart';

class CampoRadioButton extends StatefulWidget {
  const CampoRadioButton({super.key});

  @override
  State<CampoRadioButton> createState() => _CampoRadioButtonState();
}

class _CampoRadioButtonState extends State<CampoRadioButton> {

  String _escolha = "";

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
            Text("Masculino"),
            Radio(
                value: "M",
                groupValue: _escolha,
                onChanged: (String? escolha){
                  setState(() {
                    _escolha = escolha!;
                  });
                }
            ),
            Text("Feminino"),
            Radio(
                value: "F",
                groupValue: _escolha,
                onChanged: (String? escolha){
                  setState(() {
                    _escolha = escolha!;
                  });
                }
            ),
            TextButton(
                onPressed: (){
                  print(_escolha);
                },
                child: Text("Enviar")
            )
          ],
        ),
      ),
    );
  }
}
