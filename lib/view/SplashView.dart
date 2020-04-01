import 'package:flutter/material.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/HomeViewNew.dart';
import 'package:yoga_app/view/LoginView.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userController = UserController();

    userController.isLogado(context).then((value){
      Future.delayed(Duration(milliseconds: 1000), (){
        if(value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeViewNew()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
        }
      });
    });
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: double.infinity,
                ),
                Positioned(
                    bottom: 150,
                    left: -40,
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          color: Colors.tealAccent[100].withOpacity(0.1)),
                    )),
                Positioned(
                    top: -120,
                    left: 100,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: Colors.tealAccent[100].withOpacity(0.1)),
                    )),
                Positioned(
                    top: -50,
                    left: 0,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.tealAccent[100].withOpacity(0.1)),
                    )),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          color: Colors.tealAccent[100].withOpacity(0.1)),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("images/logo_icon.png", width: MediaQuery.of(context).size.width - 200,),
                      ],
                    ),
                    SizedBox( height: 150),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator( backgroundColor: Colors.white,),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Aguarde, carregando informações...", style: TextStyle(color: Colors.white),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
