import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/CreateAccountView.dart';
//class Login extends StatefulWidget {
//  @override
//  _LoginState createState() => _LoginState();
//}
//
//class _LoginState extends State<Login> {
//
//  var userController = UserController();
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SingleChildScrollView(
//        child: Container(
//          height: MediaQuery.of(context).size.height,
//          width: MediaQuery.of(context).size.width,
//          decoration: BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage("images/background.jpg"),
//                  fit: BoxFit.cover
//              )
//          ),
//
//          child: Column(
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(left: 7, right: 7),
//                child: Container(
//                  height: 250,
//                  width: MediaQuery.of(context).size.width,
//                  decoration: BoxDecoration(
//                      color: Color.fromRGBO(255, 255, 255, 0.8),
//                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
//                  ),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
//                      Image.asset("images/logo.png", height: 100,),
//                      Padding(
//                        padding: EdgeInsets.only(top: 0, bottom: 20),
//                        child: Text(
//                          "Soul Zen Yoga Shala",
//                          style: TextStyle(
//                              fontWeight: FontWeight.w400,
//                              color: Colors.blueGrey,
//                              fontSize: 25
//                          ),
//                        ),
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(top: 0, bottom: 20),
//                        child: Text(
//                          "LOGIN",
//                          style: TextStyle(
//                              fontWeight: FontWeight.w300,
//                              color: Colors.blueGrey,
//                              fontSize: 15
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//
//
//              Container(
//                padding: EdgeInsets.all(15),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
//                      child: Container(
//                        padding: EdgeInsets.only(left: 10, right: 10),
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.all(Radius.circular(10))
//                        ),
//                        child: TextFormField(
//                          decoration: new InputDecoration(
//                              labelText: "Email",
//                              hintText: "example@mail.com",
//                              border: InputBorder.none
//                          ),
//                          keyboardType: TextInputType.emailAddress,
//                          controller: userController.textControllerEmail,
//                        ),
//                      ),
//                    ),
//                    Container(
//                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
//                      child: Container(
//                        padding: EdgeInsets.only(left: 10, right: 10),
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.all(Radius.circular(10))
//                        ),
//                        child: TextFormField(
//                          decoration: new InputDecoration(
//                              labelText: "Senha",
//                              hintText: "Mínimo 6 caracteres",
//                              border: InputBorder.none
//                          ),
//                          keyboardType: TextInputType.visiblePassword,
//                          controller: userController.textControllerSenha,
//                          obscureText: true,
//                        ),
//                      ),
//                    ),
//                    Container(
//                      padding: EdgeInsets.all(10),
//                      child: SizedBox(
//                        width: MediaQuery.of(context).size.width,
//                        height: 50,
//                        child: FlatButton(
//                          child: Text("Entrar", style: TextStyle( color: Colors.white),),
//                          onPressed: (){
//                            userController.validarUsuario(context);
//                          },
//                          color: Color.fromRGBO(0, 0, 0, 0.5),
//                        ),
//                      ),
//                    ),
//                    Container(
//                      child: FlatButton(
//                        child: Text("Criar Conta", style: TextStyle(color: Colors.white),),
//                        onPressed: (){
//                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
////                          DialogAlert().showProgressDialog(context, "Verificando Credenciais...");
//                        },
//                      ),
//                    )
//                  ],
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//
//    );
//  }
//}

class Login extends StatefulWidget {
  @override
  _LoginNewState createState() => _LoginNewState();
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}

class _LoginNewState extends State<Login> {
  var userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: EmptyAppBar(),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                  color: Colors.blueAccent,
                ),
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
                    height: 70.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("images/logo_icon.png", width: MediaQuery.of(context).size.width - 150,),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                        elevation: 2.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Efetue Login", style: TextStyle(fontSize: 18,color: Colors.blueGrey),),
                              Image.asset("images/botton.png", width: MediaQuery.of(context).size.width-100,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                      labelText: "Email",
                      hintText: "example@mail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: userController.textControllerEmail,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                      labelText: "Senha",
                      hintText: "Mínimo 6 caracteres",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: userController.textControllerSenha,
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: RaisedButton(
                    child: Text("Login", style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      userController.validarUsuario(context);
                    },
                    color: Colors.blue,
                  ),
                ),
                Container(
                  child: FlatButton(
                    child: Text("Criar Conta", style: TextStyle(color: Colors.blue),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

