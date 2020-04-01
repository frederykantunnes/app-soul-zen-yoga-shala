import 'package:flutter/material.dart';
import 'package:yoga_app/model/PostClass.dart';

class FeedViewDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Soul Zen Yoga Shala"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(PostClass.selectedPost.imagem),
              Padding(
                padding: EdgeInsets.all(10),
                child: (
                    Column(
                      children: <Widget>[
                        Text(PostClass.selectedPost.titulo, textAlign: TextAlign.center, style: TextStyle(fontSize: 17),),
                        SizedBox(
                          height: 20,
                        ),
                        Text(PostClass.selectedPost.descricao, textAlign: TextAlign.justify,),
                      ],
                    )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
