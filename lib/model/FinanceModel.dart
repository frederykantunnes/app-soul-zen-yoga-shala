import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoga_app/config/StringsConfig.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:intl/intl.dart';


class FinanceClass{

  final int id;
  final String data_venc;
  final String data_pag;
  final String valor;
  final String mes_ref;

  FinanceClass({this.id, this.data_venc, this.data_pag, this.valor, this.mes_ref});

  factory FinanceClass.fromJson(Map<String, dynamic> json) {
    return FinanceClass(
        id: json['id'],
        data_venc: json['data_venc'],
        data_pag: json['data_pag'],
        valor: json['valor'],
        mes_ref: json['mes_ref']
    );
  }


  String getVencimento(){
      return DateFormat('dd/MM/y').format(DateTime.parse(this.data_venc));
  }

  String getPagamento(){
    if (this.data_pag == null){
      return "Em Aberto";
    }else{
      return DateFormat('dd/MM/y').format(DateTime.parse(this.data_pag));
    }
  }

  Future<List<FinanceClass>> fetchFinance() async {
    final response = await http.get(StringsConfig().urlApi+StringsConfig().ep_financeiros+UserController.usuarioLogado.id.toString());
    print(StringsConfig().urlApi+StringsConfig().ep_financeiros+UserController.usuarioLogado.id.toString());
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<FinanceClass> agenda = null;
      agenda = l.map((i)=> FinanceClass.fromJson(i)).toList();
      return agenda;
      // return PostClass.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

}