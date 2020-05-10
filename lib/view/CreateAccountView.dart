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
  var botao_text = "Avançar";
  var cor = Colors.blueAccent;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
      ),

      body: Container(
          child: Stepper(
            type: StepperType.horizontal,
            steps: [
              Step(
                isActive: true,
                title: Text("Dados"),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Dados Pessoais", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),),
                    SizedBox( height: 10,),
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
                  subtitle: Text('Pessoais')
              ),
              Step(
                isActive: true,
                title: Text("Endereço"),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Endereço", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),),
                    SizedBox( height: 10,),
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
                  subtitle: Text('Completo')
              ),
              Step(
                  isActive: true,
                  title: Text("Senha"),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Senha de Acesso", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),),
                      SizedBox( height: 10,),
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
                  ),
                subtitle: Text('de Acesso'),
              ),
            ],
            currentStep: _index,
            onStepTapped: (index) {
              setState(() {
                _index = index;
              });

              if(_index==2){
                setState(() {
                  botao_text = 'Criar Conta';
                  cor = Colors.greenAccent;
                });
              }else{
                setState(() {
                  botao_text = 'Avançar';
                  cor = Colors.blueAccent;
                });
              }
            },
            onStepCancel: () {
              Navigator.pop(context);
            },
            onStepContinue: () {
              if(_index<2){
                setState(() {
                  _index++;
                });
              }else{
                userController.createAccount(context);
              }

              if(_index==2){
                setState(() {
                  botao_text = 'Criar Conta';
                  cor = Colors.greenAccent;
                });
              }else{
                setState(() {
                  botao_text = 'Avançar';
                  cor = Colors.blueAccent;
                });
              }
            },
              controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 50,
                        child: RaisedButton(
                          color: cor,
                          onPressed: onStepContinue,
                          child: Text(botao_text, style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    )
                  ],
                );
              }
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