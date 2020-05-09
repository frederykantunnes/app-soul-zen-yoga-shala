import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yoga_app/config/StringsConfig.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/model/UserModel.dart';
import 'package:yoga_app/view/DialogAlert.dart';
import 'package:yoga_app/view/pages_home/TurmaView.dart';

class TurmaClass{

  final int id;
  final String nome;
  final String descricao;
  final String codigodeacesso;

  TurmaClass({this.id, this.nome, this.descricao, this.codigodeacesso});

  factory TurmaClass.fromJson(Map<String, dynamic> json) {
    return TurmaClass(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      codigodeacesso: json['codigodeacesso'],

    );
  }

  Future<TurmaClass> entrarNaTurma(String code, BuildContext context) async {
    final response = await http.get(StringsConfig().urlApi+"/entrarnaturma/"+UserController.usuarioLogado.id.toString()+"/"+code);
    if (response.statusCode == 200) {
      Navigator.pop(context);
      TurmaClass turma = TurmaClass.fromJson(json.decode(response.body));
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => TurmaView()));
      DialogAlert().showMessageDialog(context, "Ingresso na turma", "Parabéns, Ingresso realizado com sucesso!");
      UserController.usuarioLogado.turma = turma.id.toString();
      return turma;
    } else {
      Navigator.pop(context);
      DialogAlert().showMessageDialog(context, "Ingresso na turma", "Ops, algo deu errado, verifique codigo de acesso!");
//      throw Exception('Failed to load data');
    }
  }

  Future<bool> sairDaTurma(String code) async {
    final response = await http.get(StringsConfig().urlApi+StringsConfig().ep_turma+"/"+code+"/logout/"+UserController.usuarioLogado.id.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  String toString() {
    return 'TurmaClass{id: $id, nome: $nome, descricao: $descricao, codigodeacesso: $codigodeacesso}';
  }


}