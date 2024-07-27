import 'package:atm_consultoria/TelaClientes.dart';
import 'package:atm_consultoria/TelaContato.dart';
import 'package:atm_consultoria/TelaEmpresa.dart';
import 'package:atm_consultoria/TelaServicos.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  void NavegarPagina(String pagina){

    if(pagina == "empresa")
    {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaEmpresa(),)
      );
    } else if(pagina == "servicos")
    {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaServicos())
      );
    }
    else if(pagina == "clientes")
    {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaClientes(),)
      );
    }
    else if(pagina == "contato")
    {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaContato(),)
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          "ATM consultoria",
          style: TextStyle(
            color: Colors.white
          )
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Image.asset("imgs/logo.png",),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: (){
                        NavegarPagina("empresa");
                      },
                      icon: Image.asset("imgs/menu_empresa.png",height: 100,width: 100,),
                      style: IconButton.styleFrom(
                        shape: BeveledRectangleBorder()
                      ),
                  ),
                  IconButton(
                    onPressed: (){
                      NavegarPagina("servicos");
                    },
                    icon: Image.asset("imgs/menu_servico.png",height: 100,width: 100,),
                    style: IconButton.styleFrom(
                        shape: BeveledRectangleBorder()
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      NavegarPagina("clientes");
                    },
                    icon: Image.asset("imgs/menu_cliente.png",height: 100,width: 100,),
                    style: IconButton.styleFrom(
                        shape: BeveledRectangleBorder()
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      NavegarPagina("contato");
                    },
                    icon: Image.asset("imgs/menu_contato.png",height: 100,width: 100,),
                    style: IconButton.styleFrom(
                        shape: BeveledRectangleBorder()
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
