import 'package:flutter/material.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/DialogAlert.dart';
import 'package:yoga_app/view/LoginView.dart';

class ProfileView extends StatefulWidget {
  final String title = "Perfil";
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: new Alignment(
                0.0, 1.0), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xFFC5C5C5),
              const Color(0xFFFFFFFF),
            ], // whitish to gray
            tileMode: TileMode.clamp, // repeats the gradient over the canvas
          )),
      child: new Stack(
        children: <Widget>[
          new ClipPath(
            clipper: new ArcClipper(),
            child: new Stack(
              children: <Widget>[
                Container(

                  height: _height / 3.5,
                  child: Stack(
                    children: <Widget>[
                    Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.blueAccent,
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
                        )),]),
                )
//                new Image.asset(
//                  'images/back.jpg',
//                  fit: BoxFit.fitHeight,
//                  height: _height / 2.5,
//                  colorBlendMode: BlendMode.clear,
//                ),
              ],
            ),
          ),
          new Align(
            alignment: Alignment.topRight,
            child: new Padding(
              padding:
              new EdgeInsets.only(top: _height / 5.5, right: _width / 20),
              child: new FloatingActionButton(
                onPressed: () {},
                child: new Icon(Icons.settings, color: Colors.blueAccent,),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: _height / 5.1, left: _width / 20),
            child: new Material(
              child: new CircleAvatar(
                  backgroundImage: new AssetImage(
                    'images/background.png',
                  ),
                  radius: _height / 12),
              elevation: 15.0,
              color: Colors.transparent,
              borderRadius:
              new BorderRadius.all(new Radius.circular(_height / 12)),
            ),
          ),
          new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            backgroundColor: Colors.transparent,
            body: new Container(
              child: new Stack(
                children: <Widget>[

                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 6.3, left: _width / 2.5),
                    child: new Row(
                      children: <Widget>[
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Dados Pessoais',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 3.8,
                        left: _width / 20,
                        right: _width / 20,
                        bottom: _height / 8),
                    child: new Container(
                      padding: EdgeInsets.only(top: 20),
                      child: new SingleChildScrollView(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Nome: "+ UserController.usuarioLogado.nome),
                          Text("Data de Nascimento: "+ UserController.usuarioLogado.nascimento),
                          Divider(),
                          Text("Email: "+ UserController.usuarioLogado.email),
                          Text("Telefone: "+ UserController.usuarioLogado.telefone),
                          Divider(),
                          Text("Endereço: "+ UserController.usuarioLogado.endereco),
                          Text("Bairro: "+ UserController.usuarioLogado.bairro),
                          Text("Cidade: "+ UserController.usuarioLogado.cidade),
                          Text("CEP: "+ UserController.usuarioLogado.cep),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              color: Colors.redAccent,
                              child: Text("Sair da Conta", style: TextStyle(color: Colors.white),),
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
                              },
                            ),
                          )
                        ],
                        )
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SHLabel extends StatelessWidget {
  String label;
  SHLabel({this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
      child: Text(
        label,
        style: new TextStyle(fontSize: 10.0, color: Colors.white),
      ),
      decoration: new BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.all(new Radius.circular(8.0))),
      margin: EdgeInsets.only(right: 4.0),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 3 * size.height / 4);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

