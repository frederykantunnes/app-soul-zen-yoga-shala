import 'package:crypto/crypto.dart';
import 'package:yoga_app/config/DatabaseHelper.dart';
import 'package:yoga_app/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/view/DialogAlert.dart';
import 'package:yoga_app/config/StringsConfig.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoga_app/view/HomeViewNew.dart';

class UserController{
  static UserModel usuarioLogado;
  final dbHelper = DatabaseHelper.instance;
//  Login Controllers
  final textControllerEmail = TextEditingController();
  final textControllerSenha = TextEditingController();
//  Create Account Controllers
  final textControllerCANome = TextEditingController();
  final textControllerCAEmail = TextEditingController();
  final textControllerCATelefone = TextEditingController();
  final textControllerCANascimento = TextEditingController();
  final textControllerCARua = TextEditingController();
  final textControllerCABairro = TextEditingController();
  final textControllerCACidade = TextEditingController();
  final textControllerCACEP = TextEditingController();
  final textControllerCASenha = TextEditingController();
  final textControllerCACnofirmacaoSenha = TextEditingController();
  static String nascimentoFinal;


  final textControllerSenhaAntiga = TextEditingController();

  Future<UserModel> createAccount(BuildContext context) async{
    String nome = textControllerCANome.text;
    String email = textControllerCAEmail.text;
    String telefone = textControllerCATelefone.text;
    String nascimento = textControllerCANascimento.text;
    String rua = textControllerCARua.text;
    String bairro = textControllerCABairro.text;
    String cidade = textControllerCACidade.text;
    String cep = textControllerCACEP.text;
    String senha = textControllerCASenha.text;
    String confirmacaosenha = textControllerCACnofirmacaoSenha.text;

    if(nome.isEmpty || email.isEmpty || telefone.isEmpty || nascimento.isEmpty || cidade.isEmpty || cep.isEmpty || senha.isEmpty || confirmacaosenha.isEmpty){
      DialogAlert().showMessageDialog(context, "Criar Conta", "Preencha todos os campos obrigatórios!");
    }else{
      if(senha != confirmacaosenha){
        DialogAlert().showMessageDialog(context, "Criar Conta", "Senhas Não Coincidem!");
      }else{
        if(senha.length < 6){
          DialogAlert().showMessageDialog(context, "Criar Conta", "Senha deve conter no mínimo 6 caracteres!");
        }else{
    try{
      DialogAlert().showProgressDialog(context, "Criando Conta...");
      final response = await http.post(StringsConfig().urlApi+StringsConfig().ep_users, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(<String, String>{'email': email, 'nome': nome, 'telefone': telefone, 'nascimento': nascimentoFinal, 'endereco': rua, 'bairro': bairro, 'cidade': cidade, 'cep': cep, 'senha': md5.convert(utf8.encode(senha)).toString()}));
        if (response.statusCode == 201) {
          Navigator.pop(context);
          UserModel user = UserModel.fromJson(json.decode(response.body));
          _insert(user);
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeViewNew()));
          DialogAlert().showMessageDialog(context, "Conta Criada", "Bem vindo ao App Soul Zen Yoga Shala!");
        } else {
//          Navigator.pop(context);
          DialogAlert().showMessageDialog(context, "Criar Conta", "Algo Deu errado");
          throw Exception(response.statusCode);
        }
        }
    catch(e){
      DialogAlert().showMessageDialog(context, "Erro ao Criar Conta", e.toString());
      throw e;}
        }
      }
    }
  }

  Future<UserModel> updateAccount(BuildContext context) async{
    String nome = textControllerCANome.text;
    String telefone = textControllerCATelefone.text;
    String nascimento = textControllerCANascimento.text;
    String rua = textControllerCARua.text;
    String bairro = textControllerCABairro.text;
    String cidade = textControllerCACidade.text;
    String cep = textControllerCACEP.text;

    if(nome.isEmpty || telefone.isEmpty || nascimento.isEmpty || cidade.isEmpty || cep.isEmpty){
      DialogAlert().showMessageDialog(context, "Atualizar Dados", "Preencha todos os campos obrigatórios!");
    }else{
//          Código Aqui
          try{
//        UserModel userPost = new UserModel(email: email, nome: nome, telefone: telefone, nascimento: nascimento, endereco: rua, bairro: bairro, cidade: cidade, cep: cep, dataprimeiraaula: null, turma: null, tipo: 0, senha: md5.convert(utf8.encode(senha)).toString());
//        final response = await http.post(StringsConfig().urlApi+StringsConfig().ep_users, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(<String, String>{"email": "testeone@gmail.com","nome":"vix", "telefone": "098", "nascimento": "1991-01-01", "endereco": "asdasd", "bairro": "asdasd", "cidade": "asdasd", "cep": "45544555", "tipo": "1", "senha": "123456"}));

            DialogAlert().showProgressDialog(context, "Atualizando Dados...");
            final response = await http.put(StringsConfig().urlApi+StringsConfig().ep_users+"/"+usuarioLogado.id.toString(), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(<String, String>{'email': usuarioLogado.email, 'nome': nome, 'telefone': telefone, 'nascimento': nascimentoFinal, 'endereco': rua, 'bairro': bairro, 'cidade': cidade, 'cep': cep, 'senha': usuarioLogado.senha}));
            if (response.statusCode == 200) {
              Navigator.pop(context);
              UserModel user = UserModel.fromJson(json.decode(response.body));
              delete(context);
              _insert(user);
              Navigator.pop(context);
              Navigator.pop(context);
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
              DialogAlert().showMessageDialog(context, "Atualizar Dados", "Dados Atualizados com sucesso");
            } else {
//          Navigator.pop(context);
              DialogAlert().showMessageDialog(context, "Atualizar Dados", "Algo Deu errado, tente novamente");
              throw Exception(response.statusCode);
            }
          }
          catch(e){
            DialogAlert().showMessageDialog(context, "Erro ao Atualizar Dados", e.toString());
            throw e;}
    }
  }

  Future<UserModel> updatePassword(BuildContext context, String novasenha) async{
    String nome = usuarioLogado.nome;
    String telefone = usuarioLogado.telefone;
    nascimentoFinal = usuarioLogado.nascimento;
    String rua = usuarioLogado.endereco;
    String bairro = usuarioLogado.bairro;
    String cidade = usuarioLogado.cidade;
    String cep = usuarioLogado.cep;
      try{
        DialogAlert().showProgressDialog(context, "Alterando Senha...");
        final response = await http.put(StringsConfig().urlApi+StringsConfig().ep_users+"/"+usuarioLogado.id.toString(), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(<String, String>{'email': usuarioLogado.email, 'nome': nome, 'telefone': telefone, 'nascimento': nascimentoFinal, 'endereco': rua, 'bairro': bairro, 'cidade': cidade, 'cep': cep, 'senha': novasenha}));
        if (response.statusCode == 200) {
          Navigator.pop(context);
          UserModel user = UserModel.fromJson(json.decode(response.body));
          delete(context);
          _insert(user);
          Navigator.pop(context);
          Navigator.pop(context);
          DialogAlert().showMessageDialog(context, "Alterar Senha", "Senha alterada com sucesso");
        } else {
          DialogAlert().showMessageDialog(context, "Alterar Senha", "Algo Deu errado, tente novamente");
          throw Exception(response.statusCode);
        }
      }
      catch(e){
        DialogAlert().showMessageDialog(context, "Erro ao Alterar Senha", e.toString());
        throw e;}
  }


  Future<UserModel> validarUsuario(BuildContext context) async {
    String email_text = textControllerEmail.text.toString();
    String senha_text = textControllerSenha.text.toString();
    if (email_text.isEmpty || senha_text.isEmpty){
      DialogAlert().showMessageDialog(context, "Login", "Usuário e/ou Senha em Branco!");
    }else{
      DialogAlert().showProgressDialog(context, "Verificando Credenciais...");
      final response = await http.get(StringsConfig().urlApi+"/autenticar/"+email_text.replaceAll(' ', '') +"/"+md5.convert(utf8.encode(senha_text)).toString());
      if (response.statusCode == 200 && json.decode(response.body).length > 0) {
        if(response.body=="[null]"){
          Navigator.pop(context);
          DialogAlert().showMessageDialog(context, "Login", "Usuário e/ou Senha inválidos!");
        }else{
          UserModel user = UserModel.fromJson(json.decode(response.body)[0]);
          _insert(user);
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeViewNew()));
        }
      } else {
        Navigator.pop(context);
        DialogAlert().showMessageDialog(context, "Login", "Usuário e/ou Senha Inválidos!");
        throw Exception('Failed to load data');
      }
    }
  }


  void validarAlteracaoDeSenha(BuildContext context){
    String novasenha = textControllerCASenha.text;
    String novaconfirmacaosenha = textControllerCACnofirmacaoSenha.text;
    String senhaantiga = textControllerSenhaAntiga.text;
    if(md5.convert(utf8.encode(senhaantiga)).toString() != usuarioLogado.senha){
      DialogAlert().showMessageDialog(context, "Alterar Senha", "Senha Antiga Incorreta, tente novamente!");
    }else{
      if(novasenha != novaconfirmacaosenha){
        DialogAlert().showMessageDialog(context, "Alterar Senha", "As Novas Senhas Não Coincidem!");
      }else{
        if(novasenha.length < 6){
          DialogAlert().showMessageDialog(context, "Alterar Senha", "A Nova senha deve conter no mínimo 6 caracteres!");
        }else{
          updatePassword(context, md5.convert(utf8.encode(novasenha)).toString());
        }
      }
      }
  }


  void _insert(UserModel user) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.nomeColumn : user.nome,
      DatabaseHelper.nascimentoColumn  : user.nascimento,
      DatabaseHelper.emailColumn: user.email,
      DatabaseHelper.senhaColumn: user.senha,
      DatabaseHelper.telefoneColumn: user.telefone,
      DatabaseHelper.cidadeColumn: user.cidade,
      DatabaseHelper.idColumn: user.id,
    };
    final id = await dbHelper.insert(row);
    usuarioLogado = user;
  }

  Future<bool> isLogado(BuildContext context) async {
    final allRows = await dbHelper.queryAllRows();
    if(allRows.length>0){
      usuarioLogado = UserModel.fromJson(allRows.elementAt(0));
      final response = await http.get(StringsConfig().urlApi+"/autenticar/"+usuarioLogado.email +"/"+usuarioLogado.senha);
      if (response.statusCode == 200 && json.decode(response.body).length > 0 && response.body != '[null]') {
        //atualizando os dados do usuario
        UserModel user = UserModel.fromJson(json.decode(response.body)[0]);
        delete(context);
        _insert(user);
        usuarioLogado = user;
        return true;
      } else {
        //usuario mudou a senha
        delete(context);
        usuarioLogado = null;
        return false;
      }
    }else{
      //nenhum logado
      usuarioLogado = null;
      return false;
    }
  }

  Future<bool> delete(BuildContext context) async {
    dbHelper.delete(usuarioLogado.id);
    return isLogado(context);
  }
}