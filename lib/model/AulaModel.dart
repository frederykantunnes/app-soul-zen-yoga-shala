import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoga_app/config/StringsConfig.dart';
import 'package:yoga_app/controller/UserController.dart';

class AulaClass{

  final int id;
  final String titulo;
  final String dia_semana;
  final String hora_inicio_fim;
  final String professor;


  AulaClass({this.id, this.titulo, this.dia_semana, this.hora_inicio_fim, this.professor});

  factory AulaClass.fromJson(Map<String, dynamic> json) {
    return AulaClass(
        id: json['id'],
        titulo: json['titulo'],
        dia_semana: json['dia_semana'],
        hora_inicio_fim: json['hora_inicio_fim'],
        professor: json['professor'],
    );
  }

  Future<List<AulaClass>> fetchAula() async {
    final response = await http.get(StringsConfig().urlApi+StringsConfig().ep_aulas+UserController.usuarioLogado.turma);
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<AulaClass> aula = null;
      aula = l.map((i)=> AulaClass.fromJson(i)).toList();
      return aula;
    } else {
      throw Exception('Failed to load data');
    }
  }

}