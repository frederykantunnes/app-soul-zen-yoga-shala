import 'package:flutter/material.dart';
import 'package:yoga_app/controller/UserController.dart';


class MessagesClass{
  int id;
  String message;
  DateTime data;
  int idusuariosend;
  int idusuarioreceived;

  MessagesClass({this.id, this.message, this.data, this.idusuariosend,
    this.idusuarioreceived});

  bool isMy(){
    return UserController.usuarioLogado.id == idusuariosend;
  }
}