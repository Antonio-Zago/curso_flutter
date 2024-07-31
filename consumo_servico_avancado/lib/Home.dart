import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'Post.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<Map> RecuperarPreco() async{
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));

    return json.decode(response.body);
  }

  Future<List<Post>> RecuperarPosts() async{


    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Uri.parse(url));
    List<Post> postagens = [];
    var dadosJson = json.decode(response.body);

    for(var post in dadosJson){
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);

      postagens.add(p);
    }

    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviços avançado"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Post>>(
        future: RecuperarPosts(),
        builder: (context, snapshot){
          String resultado;
          switch (snapshot.connectionState) {
              case ConnectionState.none :
                print("none");
                resultado = "none";
                break;
              case ConnectionState.waiting:
                print("waiting");
                return CircularProgressIndicator();
                break;
              case ConnectionState.active:
                resultado = "active";
                print("active");
                break;
              case ConnectionState.done:
                if(snapshot.hasError){
                  resultado = "Erro";
                }
                else{
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(snapshot.data![index].id.toString()),
                          subtitle: Text(snapshot.data![index].body),
                        );
                      }
                  );
                }

                break;
            }
            return Container(
              child: Text(
                  resultado
              ),
            );
        },
      ),
    );
  }
}
