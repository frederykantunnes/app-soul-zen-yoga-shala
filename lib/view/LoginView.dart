import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/CreateAccountView.dart';
import 'package:yoga_app/view/DialogAlert.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var userController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover
              )
          ),

          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 7, right: 7),
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset("images/logo.png", height: 100,),
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 20),
                        child: Text(
                          "Soul Zen Yoga Shala",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                              fontSize: 25
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 20),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.blueGrey,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Email",
                              hintText: "example@mail.com",
                              border: InputBorder.none
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: userController.textControllerEmail,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Senha",
                              hintText: "Mínimo 6 caracteres",
                              border: InputBorder.none
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          controller: userController.textControllerSenha,
                          obscureText: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: FlatButton(
                          child: Text("Entrar", style: TextStyle( color: Colors.white),),
                          onPressed: (){
                            userController.validarUsuario(context);
                          },
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        child: Text("Criar Conta", style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
//                          DialogAlert().showProgressDialog(context, "Verificando Credenciais...");
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
