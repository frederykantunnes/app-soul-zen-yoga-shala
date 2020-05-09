import 'package:flutter/material.dart';
import 'package:yoga_app/model/PostModel.dart';

class FeedViewDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Soul Zen Yoga Shala"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              ClipRRect(
                borderRadius: BorderRadius.only( bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                child: Image.network(
                  "http://admin.soulzenyogashala.com.br/"+PostClass.selectedPost.imagem,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: (
                    Column(
                      children: <Widget>[
                        Text(PostClass.selectedPost.titulo, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                        SizedBox(
                          height: 10,
                        ),
                        Text(PostClass.selectedPost.descricao, textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
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
