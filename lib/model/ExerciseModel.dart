import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoga_app/config/StringsConfig.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/model/UserModel.dart';
import 'package:yoga_app/view/DialogAlert.dart';

class ExerciseClass{
  final int id;
  final String titulo;
  final String descricao;
  final String duracao;
  final String imagem;
  final String audio_video;
  final String gratuito;

  ExerciseClass({this.id, this.titulo, this.descricao, this.duracao, this.imagem,
    this.audio_video, this.gratuito});

  factory ExerciseClass.fromJson(Map<String, dynamic> json) {
    return ExerciseClass(
        id: json['id'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        duracao: json['duracao'],
        imagem: json['imagem'],
        audio_video: json['audio_video'],
        gratuito: json['gratuito']
    );
  }


  Future<List<ExerciseClass>> getExercisesFree() async {
    final response = await http.get(StringsConfig().urlApi+StringsConfig().ep_exerc_free);
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<ExerciseClass> exercicio = null;
      exercicio = l.map((i)=> ExerciseClass.fromJson(i)).toList();
      return exercicio;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ExerciseClass>> getExercisesTurm() async {
    String id = UserController.usuarioLogado.turma;
    final response = await http.get(StringsConfig().urlApi+StringsConfig().ep_exerc+id);
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<ExerciseClass> exercicio = null;
      exercicio = l.map((i)=> ExerciseClass.fromJson(i)).toList();
      return exercicio;
    } else {
      throw Exception('Failed to load data');
    }
  }

}