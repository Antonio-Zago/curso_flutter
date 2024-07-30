import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void CarregarItens(){

    _itens = [];

    for(int i =0; i<= 10; i++){
      Map<String, dynamic> item = Map();

      item["titulo"] = "${i.toString()}";
      item["descricao"] = "descricao: ${i.toString()}";

      _itens.add(item);
    }



  }

  @override
  Widget build(BuildContext context) {

    CarregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context,indice){
              print(indice);

              Map<String, dynamic> item = _itens[indice];

              return ListTile(
                onTap: (){
                  print(indice);

                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Alerta"),
                          content: Text(item["descricao"]),
                        );
                      }
                  );

                },
                onLongPress: (){},
                title: Text(item["descricao"]),
              );
            }
        )
      ),
    );
  }
}
