import 'package:flutter/material.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/HomeView.dart';
import 'package:yoga_app/view/LoginView.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userController = UserController();

    userController.isLogado(context).then((value){
      Future.delayed(Duration(milliseconds: 1000), (){
        if(value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
        }
      });
    });
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "images/logo.png",
                  height: 150,
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child:  Card(
                    elevation: 4,
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircularProgressIndicator(),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("Carregando informações..."),
                              )
                            ],
                          ),
                        )
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
