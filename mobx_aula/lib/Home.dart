import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/Principal.dart';
import 'package:mobx_aula/controller.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Controller controller;

  ReactionDisposer? disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    controller = Provider.of<Controller>(context);

    //autorun((_){
      //print("Dentro da home:  $controller.email");
    //});

    //Monitorando o observable formValidado, e ao ser
    // alterado chamo uma função
    //Posso utilizar para realizar alguma ação que não esteja conectada com
    //a interface
    //Só é chamado quando tem uma alteração no meu observavel
    disposer = reaction(
          (_) => controller.logado,
        (valorLogado){
            if(valorLogado){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (_) => Principal()
                )
              );
            }
        }
    );
  }

  @override
  void dispose() {
    super.dispose();
    disposer!();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobx"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(
                  label: Text("Email")
              ),
              onChanged: controller.setEmail,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("Senha")
              ),
              onChanged: controller.setSenha,
            ),
            Observer(
                builder: (_){
                  return  Text("Campos não validados : ${controller.emailSenha}");
                }
                ),
            Observer(
                builder: (_){
                  return Text(controller.contador.toString());
                }
            ),
            TextButton(
                onPressed: (){
                  controller.incrementar();
                },
                child: Text("Soma")
            ),
            TextButton(
                onPressed: (){
                  controller.logar();
                },
                child: Text("Logar")
            )
          ],
        ),
      ),
    );
  }
}
