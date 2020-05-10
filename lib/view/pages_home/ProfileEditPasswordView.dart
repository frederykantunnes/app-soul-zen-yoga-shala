import 'package:flutter/material.dart';
import 'package:yoga_app/config/StringsConfig.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/DialogAlert.dart';
import 'package:yoga_app/view/LoginView.dart';
import 'package:yoga_app/view/pages_home/FinanceView.dart';
import 'package:intl/intl.dart';


class ProfileEditPasswordView extends StatefulWidget {
  @override
  _ProfileEditViewState createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditPasswordView> {
  var userController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),

      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40,),
                Text("Alterar Senha", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                SizedBox( height: 10,),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Senha Antiga",
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: userController.textControllerSenhaAntiga,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Nova Senha",
                        hintText: "Mínimo 6 Caracteres",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: userController.textControllerCASenha,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Repita a Nova Senha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: userController.textControllerCACnofirmacaoSenha,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        child: Text("Atualizar", style: TextStyle(color: Colors.white),),
                        color: Colors.greenAccent,
                        onPressed: (){
                          userController.validarAlteracaoDeSenha(context);
                        },
                      ),
                    )
                ),
              ],
            )
        ),
      )
    );
  }
}
