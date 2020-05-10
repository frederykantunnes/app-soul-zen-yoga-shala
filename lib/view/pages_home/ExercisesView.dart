import 'package:flutter/material.dart';
import 'package:yoga_app/config/StringsConfig.dart';
import 'package:yoga_app/model/ExerciseModel.dart';
import 'package:yoga_app/view/pages_home/ExercisesViewPlay.dart';

class ExercisesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercícios"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: FutureBuilder(
            future: ExerciseClass().getExercisesFree(),
            builder: (context, projectSnap) {
              if(projectSnap.data == null){
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(backgroundColor: Colors.white,),
                        SizedBox(height: 10,),
                        Text("Buscando Exercícios...", style: TextStyle(color: Colors.white),)
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
                            height: 250.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                          ),

                          Positioned(
                              top: -120,
                              left: 100,
                              child: Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(150),
                                    color: Colors.blueAccent[100].withOpacity(0.2)),
                              )),
                          Positioned(
                              top: -50,
                              left: 0,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.blueAccent[100].withOpacity(0.2)),
                              )),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(75),
                                    color: Colors.blueAccent[100].withOpacity(0.2)),
                              )),
                          Padding(
                              padding: EdgeInsets.all(0),
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                                      child: Image.network(
                                        StringsConfig.url+exercicio.imagem,
                                        height: 250,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                  Expanded(
                                      child: SizedBox(
                                          height: 250,
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(exercicio.titulo, style: TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w700),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                                Text(exercicio.descricao, style: TextStyle(color: Colors.black45, fontSize: 18, fontWeight: FontWeight.w300), maxLines: 6, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,),
                                              ],
                                            ),
                                          )
                                      )
                                  )
                                ],
                              )
                          ),
                          Positioned(
                            bottom: 30,
                            left: 110,
                            child: Text(exercicio.duracao, style: TextStyle(color: Colors.blueGrey, fontSize: 18, fontWeight: FontWeight.w300),),
                          ),
                          Positioned(
                            bottom: 7,
                            left: 110,
                            child: Text(" GRATUITO ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                backgroundColor: Colors.green,
                              ),),
                          ),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: FloatingActionButton(
                                heroTag: exercicio.id,
                                backgroundColor: Colors.green,
                                child: Icon(Icons.play_arrow),
                                onPressed: (){
                                  Navigator.push(context,  MaterialPageRoute(builder: (context){
                                    return ExercisesViewPlay(exercicio);
                                  }));
                                },
                              )),
                        ],
                      ),
                    );
                  }
              );
            }),
      )
    );
  }
}
