import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/item_controller.dart';
import 'package:mobx_aula/principal_controller.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  PrincipalController principalController = PrincipalController();


  _dialog(){
    showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            title: Text("Adicionar item"),
            content: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite uma descrição..."
              ),
              onChanged: principalController.setNovoItem,
            ),
            actions: [
              TextButton(
                  onPressed: (){ Navigator.pop(context); },
                  child: Text("Cancelar", style: TextStyle(
                      color: Colors.red
                  ),)
              ),
              TextButton(
                  onPressed: (){
                    principalController.adicionarItem();
                    Navigator.pop(context);
                  },
                  child: Text("Salvar")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<Controller>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.email,
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Observer(
        builder: (_){
          return ListView.builder(
            itemCount: principalController.lista.length,
            itemBuilder: (_, indice){
              return Observer(
                  builder: (_){
                    return ListTile(
                      title: Text(
                        principalController.lista[indice].titulo,
                        style: TextStyle(
                            decoration: principalController.lista[indice].marcado == true ? TextDecoration.lineThrough : null
                        ),
                      ),
                      leading: Checkbox(
                        value: principalController.lista[indice].marcado,
                        onChanged: principalController.lista[indice].AlterarMarcado,
                      ),
                      onTap: (){
                        principalController.lista[indice].marcado = principalController.lista[indice].marcado;
                      },
                    );
                  }
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _dialog();
        },
      ),
    );
  }
}
