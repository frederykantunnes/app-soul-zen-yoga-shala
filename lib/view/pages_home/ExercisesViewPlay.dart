import 'package:flutter/material.dart';
import 'package:yoga_app/model/ExerciseModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class ExercisesViewPlay extends StatelessWidget {
  final ExerciseClass exercicio;
  YoutubePlayerController _controller;
  ExercisesViewPlay(this.exercicio){
    _controller = YoutubePlayerController(
      initialVideoId: exercicio.audio_video,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: false,
        hideControls: true,
        hideThumbnail: true,
        disableDragSeek: true,
      ),
    );
  }
  var iconPlay = Icons.play_arrow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício Yoga"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only( bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
              child: Image.network(
                "http://admin.soulzenyogashala.com.br/"+exercicio.imagem,
                fit: BoxFit.cover,
                height: 150,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: (
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(exercicio.titulo, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                      YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                      ),
                      Text(exercicio.duracao, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      SizedBox(
                        height: 20,
                      ),
                      Text(exercicio.descricao, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
                    ],
                  )
              ),
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(iconPlay),
        onPressed: (){

          if(_controller.value.isPlaying){
            _controller.pause();
            iconPlay = Icons.play_arrow;
          }else{
            _controller.play();
            iconPlay = Icons.pause;
          }
        },
      ),
    );
  }
}