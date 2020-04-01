
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:yoga_app/model/PostClass.dart';
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
        title: Text("Feed de Notícias"),
      ),
      body: FutureBuilder(
        future: PostClass().fetchPost(),
        builder: (context, projectSnap) {
          if(projectSnap.data == null){
            return Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child:Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 10,),
                    Text("Buscando Posts...")
                  ],
                ),
              ),
            );
          }


          return ListView.builder(
            itemCount: projectSnap.data == null ? 0 : projectSnap.data.length,
            itemBuilder: (context, index) {
              PostClass post = projectSnap.data[index];
              return FlatButton(
                  onPressed: (){
                    PostClass.selectedPost = post;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedViewDetails()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              post.imagem,
                              height: 100,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: Expanded(
                              child: Text(post.titulo, textAlign: TextAlign.justify, style: TextStyle(fontSize: 17), maxLines: 3,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              );
            },
          );
          },
      ),
    );
  }
}
