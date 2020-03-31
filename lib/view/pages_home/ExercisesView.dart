import 'package:flutter/material.dart';
import 'package:yoga_app/model/ExerciseClass.dart';

class ExercisesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: ExerciseClass().exercicios.length,
        itemBuilder: (context, index){
          return Dismissible(
            key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
            background: Container(color: Colors.red, child: Align(alignment: Alignment(-0.9, 0), child: Icon(Icons.delete, color: Colors.white,),),),
            direction: DismissDirection.startToEnd,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.network(ExerciseClass().exercicios[index][3], height: 100, width: 100, fit: BoxFit.fitWidth,),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.play_circle_outline, size: 50,),
                              Text("Ouvir", style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        )
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(ExerciseClass().exercicios[index][0], style: TextStyle(fontSize: 18),),
                              Text(ExerciseClass().exercicios[index][1], style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,),
                              Text("Duração: "+ ExerciseClass().exercicios[index][2], style: TextStyle(fontSize: 15, color: Colors.deepPurple),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
            ),
          );
        }
    );
  }
}
