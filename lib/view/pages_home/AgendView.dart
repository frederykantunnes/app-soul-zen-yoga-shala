
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/model/AgendModel.dart';
import 'package:intl/intl.dart';

class AgendView extends StatefulWidget {
  @override
  _AgendViewState createState() => _AgendViewState();
}

class _AgendViewState extends State<AgendView> {
  @override

  final f = new DateFormat('dd/MM/yyyy  -  hh:mm a');
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Próximos Eventos Soul"),
          backgroundColor: Colors.blueAccent,
        ),
        body: FutureBuilder(
            future: AgendClass().fetchAgend(),
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
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child:Stack(
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 7,),
                                FloatingActionButton(
                                    backgroundColor: Colors.blueGrey,
                                    elevation: 1,
                                    child: Text(DateTime.parse(agend.data.toString()).day.toString(), style: TextStyle( fontSize: 25, fontWeight: FontWeight.w300),)
                                ),
                                Text(DateFormat('MMM').format(DateTime.parse(agend.data.toString())), style: TextStyle( fontSize: 20, fontWeight: FontWeight.w300, color: Colors.blueGrey),),
                                Text(DateFormat('H').format(DateTime.parse(agend.data.toString()))+'h'+DateFormat('mm').format(DateTime.parse(agend.data.toString()))+'min', style: TextStyle( fontSize: 14, fontWeight: FontWeight.w300, color: Colors.blueGrey),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(agend.titulo, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.blueGrey), textAlign: TextAlign.left,),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text( agend.endereco, textAlign: TextAlign.left, style: TextStyle(fontSize: 10),),
                                      ),
                                      Text(agend.descricao, textAlign: TextAlign.justify, maxLines: 2,),
                                      SizedBox(height: 3,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text("R\$: "+agend.valor, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, color: Colors.green),),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            ),
                          )
                        ],
                      )
                    );
                  }
              );
            })
    );
  }
}
