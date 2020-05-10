import 'package:flutter/material.dart';
import 'package:yoga_app/config/StringsConfig.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/DialogAlert.dart';
import 'package:yoga_app/view/LoginView.dart';
import 'package:yoga_app/view/pages_home/FinanceView.dart';
import 'package:yoga_app/view/pages_home/ProfileEditPasswordView.dart';
import 'package:yoga_app/view/pages_home/ProfileEditView.dart';
import 'package:intl/intl.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 210.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                    color: Colors.blueAccent,
                  ),
                ),
                Positioned(
                    bottom: 150,
                    left: -40,
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          color: Colors.tealAccent[100].withOpacity(0.1)),
                    )),
                Positioned(
                    top: -120,
                    left: 100,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: Colors.tealAccent[100].withOpacity(0.1)),
                    )),
                Positioned(
                    top: -50,
                    left: 0,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.tealAccent[100].withOpacity(0.1)),
                    )),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          color: Colors.tealAccent[100].withOpacity(0.1)),
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(800),
                          child: Image.network(
//                            "https://images.pexels.com/photos/588561/pexels-photo-588561.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                            UserController.usuarioLogado.foto.isEmpty?"https://images.pexels.com/photos/588561/pexels-photo-588561.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500":StringsConfig.url+"/foto_perfil/"+UserController.usuarioLogado.foto,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          UserController.usuarioLogado.nome,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          UserController.usuarioLogado.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          UserController.usuarioLogado.telefone,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FloatingActionButton(
                      elevation: 0,
                      heroTag: 'settings',
                      child: Icon(Icons.settings),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileEditView()));
                      },
                    ),
                    SizedBox(height: 5,),
                    Text('Configurações')
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  children: <Widget>[
                    FloatingActionButton(
                      elevation: 0,
                      heroTag: 'anamnese',
                      child: Icon(Icons.content_paste),
                      onPressed: (){},
                    ),
                    SizedBox(height: 5,),
                    Text('  Anamnese  ')
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  children: <Widget>[
                    FloatingActionButton(
                      elevation: 0,
                      heroTag: 'financeiro',
                      child: Icon(Icons.attach_money),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FinanceView()));
                      },
                    ),
                    SizedBox(height: 5,),
                    Text(' Financeiro ')
                  ],
                ),
              ],
            ),
            SizedBox(height: 30,),
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Dados Pessoais", style: TextStyle(fontSize: 20),),
                    SizedBox(height: 5,),
                    Text("Endereço: "+UserController.usuarioLogado.endereco),
                    Text("Bairro: "+UserController.usuarioLogado.bairro),
                    Text("Cidade: "+UserController.usuarioLogado.cidade),
                    Text("CEP: "+UserController.usuarioLogado.cep),
                    Text("Data de Nascimento: "+ DateFormat('dd/MM/y').format(DateTime.parse(UserController.usuarioLogado.nascimento))),
                    SizedBox(height: 30,),
                    Text("Turma", style: TextStyle(fontSize: 20),),
                    SizedBox(height: 5,),
                    Text("Possui turma? "+ (UserController.usuarioLogado.turma==null?"Não":"Sim")),
                    Text("Primeira Aula: "+UserController.usuarioLogado.getDataPrimeiraAula()),
                  ],
                ),
              )
            ),

            SizedBox(
              height: 10,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width-16,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Text("Alterar Senha", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileEditPasswordView()));
                },
              ),
            ),


            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.exit_to_app),
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
          }
      ),
    );
  }
}