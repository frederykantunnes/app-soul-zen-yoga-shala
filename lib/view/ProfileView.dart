import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/DialogAlert.dart';
import 'package:yoga_app/view/LoginView.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    print(UserController.usuarioLogado.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child:
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                      child: Text("Dados de Usuário", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Text(UserController.usuarioLogado.nome, style: TextStyle(fontSize: 25),),
                                Text(UserController.usuarioLogado.email, style: TextStyle(fontSize: 11, color: Colors.grey),),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(UserController.usuarioLogado.telefone, style: TextStyle(fontSize: 20, color: Colors.deepPurple),),
                                ),
                                Text("Data de Nacimento: "+UserController.usuarioLogado.nascimento),
                                Text("Cidade: "+UserController.usuarioLogado.cidade),
                              ],
                            ),
                          )
                      ),
                    ),

                    Card(
                        elevation: 4,
                        child: FlatButton(
                          onPressed: (){},
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.update),
                                Text("  Atualizar Dados")
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                        elevation: 4,
                        child: FlatButton(
                          onPressed: (){},
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.security),
                                Text("  Alterar Senha")
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                        elevation: 4,
                        child: FlatButton(
                          onPressed: (){},
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.delete),
                                Text("  Excluir Conta")
                              ],
                            ),
                          ),
                        )
                    ),
                   Card(
                      elevation: 4,
                      child: FlatButton(
                        onPressed: (){},
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.help_outline),
                              Text("  Ajuda")
                            ],
                          ),
                        ),
                      )
                  ),
                  ],
                )
          )
        )
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: RaisedButton(
                child: Text("Logout", style: TextStyle(color: Colors.white),),
                color: Colors.redAccent,
                onPressed: (){

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Logout"),
                      content: new Text("Deseja realmente sair de sua conta?"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                            child: Text("Sair"),
                            onPressed: () {
                              UserController().delete(context).then((value) {
                                if (value) {
                                  DialogAlert().showMessageDialog(context, "Sair",
                                      "Não foi possível sair do sistema!");
                                } else {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                }
                              });
                        })
                      ],
                    );
                  },
                  );

//                  build(context) {
//                    return AlertDialog(
//                      title: Text("Logout"),
//                      content: Text("Deseja realmente sair da conta?"),
//                      actions: <Widget>[
//                        FlatButton(
//                          child: Text("Cancelar"),
//                          onPressed: () {},
//                        ),
//                        FlatButton(
//                          child: Text("Sair"),
//                          onPressed: () {
//                            UserModel().delete().then((value) {
//                              if (value) {
//                                DialogAlert().showMessageDialog(context, "Sair",
//                                    "Não foi possível sair do sistema!");
//                              } else {
//                                Navigator.pop(context);
//                                Navigator.pushReplacement(context,
//                                    MaterialPageRoute(
//                                        builder: (context) => Login()));
//                              }
//                            });
//                          },
//                        )
//                      ],
//                    );
//                  }
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
