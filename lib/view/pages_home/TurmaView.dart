import 'package:flutter/material.dart';
import 'package:yoga_app/controller/UserController.dart';


class TurmaView extends StatefulWidget {
  @override
  _TurmaViewState createState() => _TurmaViewState();
}

class _TurmaViewState extends State<TurmaView> {
  @override
  Widget build(BuildContext context) {
   if(UserController.usuarioLogado.turma == null){
     return Center(
       child: Text("Nenhuma Turma"),
     );
   }else{
     return Center(
       child: Text(UserController.usuarioLogado.turma),
     );
   }
  }
}
