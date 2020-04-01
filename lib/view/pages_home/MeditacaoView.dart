import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MeditacaoView extends StatefulWidget {
  @override
  _MeditacaoViewState createState() => _MeditacaoViewState();
}



class _MeditacaoViewState extends State<MeditacaoView> {
  var myFeedbackText = "COULD BE BETTER";
  var sliderValue = 0.0;
  IconData myFeedback = FontAwesomeIcons.sadTear;
  Color myFeedbackColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          //
        }),
        title: Text("Meditação"),
        actions: <Widget>[
          IconButton(icon: Icon(
              FontAwesomeIcons.solidStar), onPressed: () {
            //
          }),
        ],
      ),
      body: Container(
        color: Color(0xffE5E5E5),
        child: Center(
            child: Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(10.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      width: 350.0,
                      height: 500.0,
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
                        Text("Escolha uma das opções abaixo que melhor se encaixa com seu humor atual e desfrute de uma meditação diferente.", textAlign: TextAlign.center,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
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
                                if (sliderValue >= 0.0 && sliderValue <= 2.0) {
                                  myFeedback = FontAwesomeIcons.sadTear;
                                  myFeedbackColor = Colors.red;
                                  myFeedbackText = "Triste";
                                }
                                if (sliderValue >= 2.1 && sliderValue <= 4.0) {
                                  myFeedback = FontAwesomeIcons.frown;
                                  myFeedbackColor = Colors.yellow;
                                  myFeedbackText = "Ansioso";
                                }
                                if (sliderValue >= 4.1 && sliderValue <= 6.0) {
                                  myFeedback = FontAwesomeIcons.meh;
                                  myFeedbackColor = Colors.amber;
                                  myFeedbackText = "Irritado";
                                }
                                if (sliderValue >= 6.1 && sliderValue <= 8.0) {
                                  myFeedback = FontAwesomeIcons.smile;
                                  myFeedbackColor = Colors.green;
                                  myFeedbackText = "Sentimental";
                                }
                                if (sliderValue >= 8.1 && sliderValue <= 10.0) {
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
                              height: 100,
                              width: 100,
                              child: FloatingActionButton(
                                child: Icon(Icons.play_circle_outline, size: 80,),
                              ),
                            )
                          ),
                        )
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
