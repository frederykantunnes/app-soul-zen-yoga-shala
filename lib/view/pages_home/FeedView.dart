
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:yoga_app/model/PostModel.dart';
import 'package:yoga_app/view/pages_home/FeedViewDetails.dart';

class FeedView extends StatefulWidget {
  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: FutureBuilder(
          future: PostClass().fetchPost(),
          builder: (context, projectSnap) {
            if(projectSnap.data == null){
              return Container(
                child: Center(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(backgroundColor: Colors.white,),
                      SizedBox(height: 10,),
                      Text("Buscando Posts...", style: TextStyle(color: Colors.white), )
                    ],
                  ),
                ),
              );
            }


            return ListView.builder(
              itemCount: projectSnap.data == null ? 0 : projectSnap.data.length,
              itemBuilder: (context, index) {
                PostClass post = projectSnap.data[index];
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: (){
                      PostClass.selectedPost = post;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedViewDetails()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
                            child: Text(post.titulo, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.w500 )),
                          ),
                          Image.network(
                            "http://admin.soulzenyogashala.com.br/"+post.imagem,
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(post.descricao, textAlign: TextAlign.justify, style: TextStyle(fontSize: 15, color: Colors.black54,), maxLines: 5,overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 5,),
                                  Text("Ler mais...", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: Colors.grey,),),
                                  SizedBox(height: 15,),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      )
    );
  }
}
