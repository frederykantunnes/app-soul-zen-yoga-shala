import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/DialogAlert.dart';


class TurmaView extends StatefulWidget {
  @override
  _TurmaViewState createState() => _TurmaViewState();
}

class _TurmaViewState extends State<TurmaView> {
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
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            color: Colors.blueAccent,
                            child: Text("Ingressar", style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              DialogAlert().showProgressDialog(context, "Validando Código...");
                            },
                          ),
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
      return Scaffold(
        body: Container(),
      );
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