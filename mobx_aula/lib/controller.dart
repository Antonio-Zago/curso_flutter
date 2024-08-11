import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{

  ControllerBase(){
    //Sempre chamado quando altero um observavel
    autorun((_){
      print(email);
      print(senha);
      print(emailSenha);
      print(formValidado);
    });
  }

  @observable
  String email = "";

  @observable
  String senha = "";

  @action
  void setEmail(valor) => email = valor;

  @action
  void setSenha(valor) => senha = valor;

  @observable
  int contador = 0;

  @observable
  bool logado = false;

  @computed
  bool get formValidado => email.length >= 5 && senha.length >= 5;

  @computed
  String get emailSenha => "$email - $senha";

  @action
  incrementar(){
    contador = contador +1;
  }

  @action
  Future<void> logar() async{
    
    await Future.delayed(Duration(seconds: 3));
    logado = true;
  }

  /*var contador = Observable(0);
  Action? incrementar;

  Controller(){
    incrementar = Action(() => _incrementar());
  }

  void _incrementar(){
    contador.value = contador.value +1;
  }*/

}