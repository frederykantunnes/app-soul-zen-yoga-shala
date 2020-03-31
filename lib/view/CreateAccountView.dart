import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga_app/controller/UserController.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var userController = UserController();
  var _index= 0;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Criar Conta"),
      ),

      body: Container(
          child: Stepper(
            steps: [
              Step(
                title: Text("Dados Pessoais"),
                content: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Nome e Sobrenome",
                          hintText: "Ex: Jose da Silva",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                      ),
                      keyboardType: TextInputType.text,
                      controller: userController.textControllerCANome,

                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Email",
                            hintText: "example@mail.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: userController.textControllerCAEmail,
                      ),
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Telefone",
                          hintText: "81 99999-9999",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                      ),
                      keyboardType: TextInputType.phone,
                      controller: userController.textControllerCATelefone,

                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),

                      child:GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Data de Nascimento",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )
                            ),
                            controller: userController.textControllerCANascimento,
                          ),
                    ),
                    ),
                    ),
                  ],
                ),
              ),
              Step(
                title: Text("Endereço"),
                content: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Rua",
                            hintText: "Ex: Rua Fulano de Tal",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                        ),
                        keyboardType: TextInputType.text,
                        controller: userController.textControllerCARua,

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Bairro",
                            hintText: "Ex: Bairro Fulano",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                        ),
                        keyboardType: TextInputType.text,
                        controller: userController.textControllerCABairro,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Cidade",
                            hintText: "Ex: Recife",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                        ),
                        keyboardType: TextInputType.text,
                        controller: userController.textControllerCACidade,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: TextFormField(
                        decoration: new InputDecoration(
                            labelText: "CEP",
                            hintText: "Ex: 99.9999-000",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                        ),
                        keyboardType: TextInputType.number,
                        controller: userController.textControllerCACEP,
                      ),
                    ),
                  ],
                ),
              ),
              Step(
                  title: Text("Senha de Acesso"),
                  content: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Senha",
                              hintText: "Mínimo 6 Caracteres",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: userController.textControllerCASenha,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Repita a Senha",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: userController.textControllerCACnofirmacaoSenha,
                        ),
                      ),
                    ],
                  )
              )
            ],
            currentStep: _index,
            onStepTapped: (index) {
              setState(() {
                _index = index;
              });
            },
            onStepCancel: () {
              print("You are clicking the cancel button.");
            },
            onStepContinue: () {
              if(_index<2){
                setState(() {
                  _index++;
                });
              }else{
                userController.createAccount(context);
              }
            },
          )
      ),
    );
  }
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String dia, mes, ano;
        ano = picked.year.toString();

        if(picked.month<10){
          mes = '0'+picked.month.toString();
        }else{
          mes = picked.month.toString();
        }

        if(picked.day<10){
          dia = '0'+picked.day.toString();
        }else{
          dia = picked.day.toString();
        }
        UserController.nascimentoFinal = ano+'-'+mes+'-'+dia;
        userController.textControllerCANascimento.value = TextEditingValue(text: dia+'/'+mes+'/'+ano );
      });
  }

}