import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoga_app/config/StringsConfig.dart';


class PostClass {


  Future<List<PostClass>> postsFuture;

  final int idusuario;
  final int id;
  final String titulo;
  final String descricao;
  final String imagem;
  final String data;

  PostClass({this.id, this.idusuario, this.titulo, this.descricao, this.imagem, this.data});

  factory PostClass.fromJson(Map<String, dynamic> json) {

    return PostClass(
      idusuario: json['idusuario'],
      id: json['id'],
      titulo: json['titulo'],
      descricao: json['descricao'],
      imagem: json['imagem'],
      data: json['data'],
    );
  }

  Future<List<PostClass>> fetchPost() async {
    final response = await http.get(StringsConfig().urlApi+StringsConfig().ep_posts+"0/10/");
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<PostClass> posts = null;
      posts = l.map((i)=> PostClass.fromJson(i)).toList();
      return posts;
      // return PostClass.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

}