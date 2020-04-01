
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/model/AgendClass.dart';


class AgendView extends StatefulWidget {
  @override
  _AgendViewState createState() => _AgendViewState();
}

class _AgendViewState extends State<AgendView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Próximos Eventos Soul"),
        ),
        body: FutureBuilder(
            future: AgendClass().fetchAgend(),
            builder: (context, projectSnap) {
              if(projectSnap.data == null){
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child:Column(
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Buscando Eventos...")
                      ],
                    ),
                  ),
                );
              }

              return ListView.builder(
                  itemCount: projectSnap.data == null ? 0 : projectSnap.data.length,
                  itemBuilder: (context, index) {
                    AgendClass agend = projectSnap.data[index];
                    return Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child:GestureDetector(
//                        onTap: (){
//
//                        },
                        child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.date_range),
                                      Text("  "+agend.titulo, style: TextStyle(fontSize: 20), textAlign: TextAlign.left,),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    child: Text( agend.endereco, textAlign: TextAlign.left, style: TextStyle(fontSize: 10),),
                                  ),
                                  Text(agend.descricao, textAlign: TextAlign.justify,),
                                  SizedBox(height: 20,),
                                  Text( agend.data.toString(), textAlign: TextAlign.left, style: TextStyle(fontSize: 15, color: Colors.grey),),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(agend.valor, textAlign: TextAlign.left, style: TextStyle(fontSize: 15, color: Colors.green),),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    );
                  }
              );
            })
    );
  }
}
