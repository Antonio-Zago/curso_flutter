import 'package:flutter/material.dart';
import 'package:navegacao/SegundaTela.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      SegundaTela.routeName : (context) => SegundaTela()
    },
    home: TelaPrincipal()
  ));
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          children: [
            TextButton(
                onPressed: (){
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SegundaTela("teste testando")
                      )
                  );*/
                  Navigator.pushNamed(
                      context,
                      "/secundaria",
                      arguments: SegundaTela("teste testando")
                  );
                },
                child: Text("Ir para próxima tela")
            )
          ],
        ),
      ),
    );
  }
}

