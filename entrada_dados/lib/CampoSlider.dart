import 'package:flutter/material.dart';

class CampoSlider extends StatefulWidget {
  const CampoSlider({super.key});

  @override
  State<CampoSlider> createState() => _CampoSliderState();
}

class _CampoSliderState extends State<CampoSlider> {

  double _valor = 0;

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
            Slider(
                value: _valor,
                min: 0,
                max: 10,
                divisions: 10,
                label: _valor.toString(),
                onChanged: (valor){
                  setState(() {
                    _valor = valor;
                  });
                }
            ),

            TextButton(
                onPressed: (){
                  print(_valor);
                },
                child: Text("Enviar")
            )
          ],
        ),
      ),
    );
  }
}
