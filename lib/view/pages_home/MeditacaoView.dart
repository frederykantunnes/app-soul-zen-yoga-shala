import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MeditacaoView extends StatefulWidget {
  @override
  _MeditacaoViewState createState() => _MeditacaoViewState();
}



class _MeditacaoViewState extends State<MeditacaoView> {
  var myFeedbackText = "Normal";
  var sliderValue = 7.5;
  IconData myFeedback = FontAwesomeIcons.smile;
  Color myFeedbackColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Meditação"),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
            child: Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 450,
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Text(myFeedbackText,
                            style: TextStyle(color: Colors.black, fontSize: 32.0),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Icon(
                            myFeedback, color: myFeedbackColor, size: 150.0,)),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Text("Escolha uma das opções abaixo que melhor se encaixa com seu humor atual e desfrute de uma meditação diferente.", textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 8),
                          child: Container(child: Slider(
                            min: 0.0,
                            max: 10.0,
                            divisions: 4,
                            value: sliderValue,
                            activeColor: Colors.lightBlue,
                            inactiveColor: Colors.lightBlue,
                            onChanged: (newValue) {
                              setState(() {
                                sliderValue = newValue;
                                if (sliderValue == 0.0) {
                                  myFeedback = FontAwesomeIcons.sadTear;
                                  myFeedbackColor = Colors.red;
                                  myFeedbackText = "Triste";
                                }
                                if (sliderValue == 2.5) {
                                  myFeedback = FontAwesomeIcons.frown;
                                  myFeedbackColor = Colors.yellow;
                                  myFeedbackText = "Ansioso";
                                }
                                if (sliderValue == 5.0) {
                                  myFeedback = FontAwesomeIcons.meh;
                                  myFeedbackColor = Colors.amber;
                                  myFeedbackText = "Irritado";
                                }
                                if (sliderValue == 7.5) {
                                  myFeedback = FontAwesomeIcons.smile;
                                  myFeedbackColor = Colors.green;
                                  myFeedbackText = "Sentimental";
                                }
                                if (sliderValue == 10.0) {
                                  myFeedback = FontAwesomeIcons.laugh;
                                  myFeedbackColor = Colors.pink;
                                  myFeedbackText = "Animado";
                                }
                              });
                            },
                          ),),
                        ),
                        Container(
                          child: Center(
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: FloatingActionButton(
                                child: Icon(Icons.play_circle_outline, size: 50,),
                              ),
                            )
                          ),
                        ),
                      ],)
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }
}
