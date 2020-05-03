import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/model/MessagesModel.dart';
import 'package:yoga_app/model/TurmaModel.dart';
import 'package:yoga_app/view/DialogAlert.dart';

class TurmaView extends StatefulWidget {
  @override
  _TurmaViewState createState() => _TurmaViewState();
}

class _TurmaViewState extends State<TurmaView> {

  TextEditingController controllerCode = new TextEditingController();

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
                          controller: controllerCode,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            color: Colors.blueAccent,
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
  const Choice(title: 'Exercícios', icon: Icons.spa),
  const Choice(title: 'Mensagens', icon: Icons.message),
  const Choice(title: 'Anamnese', icon: Icons.assignment),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    switch(choice.title){
      case "Exercícios":
        return exercicios(context);
        break;
      case "Mensagens":
        return mensagens(context);
        break;
      case "Anamnese":
        return anamnese(context);
        break;
    }
  }
}


Widget exercicios(BuildContext context){
  return Container(
    child: Center(
      child: Text("Exercícios aqui"),
    ),
  );
}


Widget mensagens(BuildContext context){
  List<MessagesClass> _listMessages = new List<MessagesClass>();
  _listMessages.add(new MessagesClass(id: 1, message: "Opa", data: new DateTime.now(), idusuarioreceived: 21, idusuariosend: 1));
  _listMessages.add(new MessagesClass(id: 2, message: "Ola", data: new DateTime.now(), idusuarioreceived: 1, idusuariosend: 21));
  _listMessages.add(new MessagesClass(id: 3, message: "Tudo bem?", data: new DateTime.now(), idusuarioreceived: 21, idusuariosend: 1));
  return Container(
      child: ListView.builder(
          itemCount: _listMessages.length,
          itemBuilder: (context, index){
            if(_listMessages[index].isMy()){
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
            }else{
              return Card(
                margin: EdgeInsets.only(right: 30, bottom: 10),
                color: Colors.white70,
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_listMessages[index].message),
                      Text(_listMessages[index].data.toString(), style: TextStyle(fontSize: 10),),
                    ],
                  ),
                )
              );
            }
          }),
  );
}


Widget anamnese(BuildContext context){
  return Container(
    child: Center(
      child: Column(
        children: <Widget>[
          Icon(Icons.verified_user, size: 200, color: Colors.lightGreen,),
          Text("Anamnase Preenchida", style: TextStyle(fontSize: 22),),
          Text("Atualizada em 28/02/2019"),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: Colors.lightBlue,
              child: Text("Atualizar Ficha", style: TextStyle(color: Colors.white),),
              onPressed: (){},
            ),
          )
        ],
      ),
    ),
  );
}
