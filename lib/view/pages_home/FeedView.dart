
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
      ),
      body: FutureBuilder(
        future: PostClass().fetchPost(),
        builder: (context, projectSnap) {
          if(projectSnap.data == null){
            return Container(
              child: Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                padding: EdgeInsets.all(0),
                  onPressed: (){
                    PostClass.selectedPost = post;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedViewDetails()));
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 150,
                        child: Padding(
                          padding: EdgeInsets.only(left: 45, top: 15, right: 10),
                          child: Card(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 30,),
                                Container(
                                  child: Expanded(
                                    child: Text(post.titulo, textAlign: TextAlign.left, style: TextStyle(fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.w300), maxLines: 5),
                                  ),
                                ),
                                SizedBox(width: 10,),
                              ],
                            ),
                          ),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Container(
//                          decoration: new BoxDecoration(
//                            border: Border.all(width: 0.2),
//                            borderRadius: BorderRadius.circular(10),
//                            shape: BoxShape.rectangle,
//                          ),
                          width: 60,
                          height:60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "http://admin.soulzenyogashala.com.br/"+post.imagem,
                              height: 100,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              );
            },
          );
          },
      ),
    );
  }
}
