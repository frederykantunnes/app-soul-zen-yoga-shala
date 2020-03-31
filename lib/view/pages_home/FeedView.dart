
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/model/PostClass.dart';

class FeedView extends StatefulWidget {
  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
          onRefresh: PostClass().fetchPost,
          child: FutureBuilder(
            future: PostClass().fetchPost(),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == null) {
                return Container(
                  child: Center(
                    child: Text("Nenhum post :("),
                  ),
                );
              }

              return ListView.builder(
                itemCount: projectSnap.data == null ? 0 : projectSnap.data.length,
                itemBuilder: (context, index) {
                  PostClass post = projectSnap.data[index];
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.network(post.imagem),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text("  " + post.titulo, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                                    )
                                  ],
                                ),
                                Text(post.descricao, textAlign: TextAlign.justify,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Image.asset("images/botton.png", height: 30,),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );},
          ),
        );
  }
}
