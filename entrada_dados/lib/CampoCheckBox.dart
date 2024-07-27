import 'package:flutter/material.dart';

class Campocheckbox extends StatefulWidget {
  const Campocheckbox({super.key});

  @override
  State<Campocheckbox> createState() => _CampocheckboxState();
}

class _CampocheckboxState extends State<Campocheckbox> {

  var _valor = false;

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
      body: Container(
        child: Column(
          children: [
            Text("Comida brasileira"),
            Checkbox(
                value: _valor,
                onChanged: (bool? valor){
                  setState(() {
                    _valor = valor!;
                  });
                },
            ),

            CheckboxListTile(
                title: Text("ListTile"),
                value: _valor,
                secondary: Icon(
                  Icons.add_box
                ),
                onChanged: (bool? valor){
                  setState(() {
                  _valor = valor!;
                  });
                },
            ),
            TextButton(
                onPressed: (){
                  print("check " + _valor.toString());
                },
                child: Text("Enviar")
            )
          ],
        ),
      ),
    );
  }
}
