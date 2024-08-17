import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String valor = "Nada salvo";

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(valor),
            TextField(
              controller: controller,
            ),
            TextButton(
                onPressed: () async{
                  String valor = controller.text;

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString("valor", valor);

                },
                child: Text("Salvar")
            ),
            TextButton(
                onPressed: () async{
                  final prefs = await SharedPreferences.getInstance();

                  setState(() {
                    valor = prefs.getString("valor")!;
                  });


                },
                child: Text("Ler")
            ),
            TextButton(
                onPressed: () async{
                  final prefs = await SharedPreferences.getInstance();

                  prefs.remove("valor");
                },
                child: Text("Remover")
            )
          ],
        ),
      ),
    );
  }
}
