import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoga_app/config/StringsConfig.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/model/ExerciseModel.dart';
import 'package:yoga_app/model/MessagesModel.dart';
import 'package:yoga_app/model/TurmaModel.dart';
import 'package:yoga_app/view/DialogAlert.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:yoga_app/view/pages_home/ExercisesViewPlay.dart';

class TurmaView extends StatefulWidget {
  @override
  _TurmaViewState createState() => _TurmaViewState();
}

class _TurmaViewState extends State<TurmaView> {

  TextEditingController controllerCode = new TextEditingController();
  String result = "Hey there !";

  @override
  Widget build(BuildContext context) {
    if( UserController.usuarioLogado.turma == null){
      return Scaffold(
        appBar: AppBar(
          title: Text("Turma"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Olá, "+UserController.usuarioLogado.nome+", vimos que ainda não faz parte de uma turma de Yoga.",textAlign: TextAlign.justify, style: TextStyle( fontSize: 17),),
                Divider(),
                Text("Caso já tenha um código de Ingresso em Turma, insira no campo abaixo e clique em Ingressar. Caso não faça parte ainda, entre em contato com a equipe Soul Zen Yoga Shala  para que te auxiliem no Ingresso",textAlign: TextAlign.justify,),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Código de Ingresso",
                              hintText: "Ex: VGSER2FD",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3)
                              )
                          ),
                          controller: controllerCode,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width:137,
                              height: 50,
                              child: RaisedButton(
                                  color: Colors.blueAccent,
                                  child: Text("Ler QR Code", style: TextStyle(color: Colors.white),),
                                  onPressed:_scanQR
//                                  _scanQR
                              ),
                            ),
                            SizedBox( width: 5, ),
                            SizedBox(
                              width: 130,
                              height: 50,
                              child: RaisedButton(
                                color: Colors.green,
                                child: Text("Ingressar", style: TextStyle(color: Colors.white),),
                                onPressed: (){
                                  if(controllerCode.text.isNotEmpty){
                                    DialogAlert().showProgressDialog(context, "Validando Código...");
                                    TurmaClass().entrarNaTurma(controllerCode.text, context);
                                  }else{
                                    DialogAlert().showMessageDialog(context, "Ingressar", "Insira um código de acesso.");
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )
              ],
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.message),
            onPressed: (){
              _launchInBrowser("https://api.whatsapp.com/send?phone=5581997980790&text=Oi!%20Encontrei%20voc%C3%AA%20pelo%20app%2C%20poderia%20me%20mandar%20mais%20informa%C3%A7%C3%B5es%20a%20respeito%20do%20espa%C3%A7o,%20e%20formas%20de%20ingresso%3F%20");
//          html.window.open("https://api.whatsapp.com/send?phone=5581997980790&text=Oi!%20Encontrei%20voc%C3%AA%20pelo%20app%2C%20poderia%20me%20mandar%20mais%20informa%C3%A7%C3%B5es%20a%20respeito%20do%20espa%C3%A7o,%20e%20formas%20de%20ingresso%3F%20", "Send");
            }
        ),
      );
    }else{
      return DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Turma de Yoga'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      );


    }
  }

//
//  Future _scan() async {
//    String barcode = await scanner.scan();
//    this.controllerCode.text = barcode;
//  }



  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        controllerCode.text = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

}



Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '     Aulas     ', icon: Icons.message),
  const Choice(title: '  Exercícios  ', icon: Icons.directions_run),
  const Choice(title: 'Notificações', icon: Icons.notifications),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    switch(choice.title){
      case "  Exercícios  ":
        return exercicios(context);
        break;
      case "     Aulas     ":
        return aulas(context);
        break;
      case "Notificações":
        return notificacoes(context);
        break;
    }
  }
}


Widget exercicios(BuildContext context){
  return FutureBuilder(
      future: ExerciseClass().getExercisesTurm(),
      builder: (context, projectSnap) {
        if(projectSnap.data == null){
          return Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 10,),
                  Text("Buscando Exercícios...")
                ],
              ),
            ),
          );
        }

        return ListView.builder(
            itemCount: projectSnap.data == null ? 0 : projectSnap.data.length,
            itemBuilder: (context, index) {
              ExerciseClass exercicio = projectSnap.data[index];
              return Padding(
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 300.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
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
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                                child: Image.network(
                                  StringsConfig.url+exercicio.imagem,
                                  height: 300,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )
                            ),
                            Expanded(
                                child: SizedBox(
                                    height: 300,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(exercicio.titulo, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                          Text(exercicio.descricao, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300), maxLines: 7, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,),
                                        ],
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    ),
                    Positioned(
                      bottom: 10,
                      left: 110,
                      child: Text(exercicio.duracao, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),),
                    ),

                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: FloatingActionButton(
                          heroTag: exercicio.id,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.play_arrow),
                          onPressed: (){
                            Navigator.push(context,  MaterialPageRoute(builder: (context)=>ExercisesViewPlay()));
                          },
                        )),
                  ],
                ),
              );
            }
        );
      });
}


Widget aulas(BuildContext context){
  List<MessagesClass> _listMessages = new List<MessagesClass>();
  _listMessages.add(new MessagesClass(id: 1, message: "Opa", data: new DateTime.now(), idusuarioreceived: 21, idusuariosend: 1));
  _listMessages.add(new MessagesClass(id: 2, message: "Ola", data: new DateTime.now(), idusuarioreceived: 1, idusuariosend: 21));
  _listMessages.add(new MessagesClass(id: 3, message: "Tudo bem?", data: new DateTime.now(), idusuarioreceived: 21, idusuariosend: 1));
  return Container(
      child: ListView.builder(
          itemCount: _listMessages.length,
          itemBuilder: (context, index){
              return Card(
                margin: EdgeInsets.only(left: 30, bottom: 10),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(_listMessages[index].message),
                        Text(_listMessages[index].data.toString(), style: TextStyle(fontSize: 10),),
                      ],
                    ),
                  )
              );
          }),
  );
}


Widget notificacoes(BuildContext context){
  return Container(
    child: Center(
      child: Text('Opa'),
    ),
  );
}