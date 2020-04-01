import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoga_app/config/StringsConfig.dart';

class AgendClass{

  final int id;
  final String titulo;
  final String descricao;
  final String link;
  final String data;
  final String endereco;
  final String valor;



  AgendClass({this.id, this.titulo, this.descricao, this.link, this.data,
    this.endereco, this.valor});

  factory AgendClass.fromJson(Map<String, dynamic> json) {
    return AgendClass(
      id: json['id'],
      titulo: json['titulo'],
      descricao: json['descricao'],
      link: json['link'],
      data: json['data'],
      endereco: json['endereco'],
      valor: json['valor']
    );
  }

  Future<List<AgendClass>> fetchAgend() async {
    final response = await http.get(StringsConfig().urlApi+StringsConfig().ep_agend);
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<AgendClass> agenda = null;
      agenda = l.map((i)=> AgendClass.fromJson(i)).toList();
      return agenda;
      // return PostClass.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

}