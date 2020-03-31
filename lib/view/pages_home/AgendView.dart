
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/model/AgendClass.dart';

class AgendView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: AgendClass().refreshAgenda,
      child: ListView.builder(
          itemCount: AgendClass().agenda.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:GestureDetector(
                onTap: (){
                  final snack = SnackBar(
                    content: Text("Confirmar Participação?"),
                    action: SnackBarAction(
                      onPressed: () {
                      },
                      label: "Sim",
                    ),
                    duration: Duration(seconds: 3),
                  );
                  Scaffold.of(context).showSnackBar(snack);
                },
                child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.date_range),
                              Text("  "+AgendClass().agenda[index][0], style: TextStyle(fontSize: 20), textAlign: TextAlign.left,),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Text(AgendClass().agenda[index][1], textAlign: TextAlign.left, style: TextStyle(fontSize: 10),),
                          ),
                          Text(AgendClass().agenda[index][2], textAlign: TextAlign.left, style: TextStyle(fontSize: 15, color: Colors.grey),),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text("R\$: " + AgendClass().agenda[index][3], textAlign: TextAlign.left, style: TextStyle(fontSize: 15, color: Colors.green),),
                          )
                        ],
                      ),
                    )
                ),
              ),
            );
          }
      ),
    );
  }
}
