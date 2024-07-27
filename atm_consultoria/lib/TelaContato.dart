import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({super.key});

  @override
  State<TelaContato> createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.lightGreen,
         title: Text(
             "Contatos",
             style: TextStyle(
                 color: Colors.white
             )
         ),
       ),
       body: Container(
         child: SingleChildScrollView(
           padding: EdgeInsets.all(20),
           child: Column(
             children: [
               Row(
                 children: [
                   Padding(
                     padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                     child: Image.asset("imgs/detalhe_contato.png"),
                   ),
                   Text(
                     "Contato",
                     style: TextStyle(
                         color: Colors.orange,
                         fontSize: 20
                     ),
                   )
                 ],
               ),
               Padding(
                 padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                 child: Text(
                     "E-mail: teste@teste.com.br"
                 ),
               ),
               Padding(
                 padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                 child: Text(
                     "Telefone: (12)9999-8888"
                 ),
               ),
             ],
           ),
         ),
       ),
     );
  }
}
