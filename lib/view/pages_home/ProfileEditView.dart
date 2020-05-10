import 'package:flutter/material.dart';
import 'package:yoga_app/config/StringsConfig.dart';
import 'package:yoga_app/controller/UserController.dart';
import 'package:yoga_app/view/DialogAlert.dart';
import 'package:yoga_app/view/LoginView.dart';
import 'package:yoga_app/view/pages_home/FinanceView.dart';
import 'package:intl/intl.dart';


class ProfileEditView extends StatefulWidget {
  @override
  _ProfileEditViewState createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  var edit = 0;
  var userController = UserController();
  var _index= 0;
  var botao_text = "Avançar";
  var cor = Colors.blueAccent;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    _formInput();
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Conta"),
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
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child:  TextFormField(
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
              ],
              currentStep: _index,
              onStepTapped: (index) {
                setState(() {
                  _index = index;
                });

                if(_index==1){
                  setState(() {
                    botao_text = 'Atualizar Dados';
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
                if(_index<1){
                  setState(() {
                    _index++;
                  });
                }else{
                  userController.updateAccount(context);
                }

                if(_index==1){
                  setState(() {
                    botao_text = 'Atualizar Dados';
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

  void _formInput(){
    if(edit==0){
      edit=1;
      userController.textControllerCANome.value = TextEditingValue(text: UserController.usuarioLogado.nome);
      userController.textControllerCATelefone.value = TextEditingValue(text: UserController.usuarioLogado.telefone);
      userController.textControllerCANascimento.value = TextEditingValue(text: DateFormat('dd/MM/y').format(DateTime.parse(UserController.usuarioLogado.nascimento)));
      userController.textControllerCARua.value = TextEditingValue(text: UserController.usuarioLogado.endereco);
      userController.textControllerCABairro.value = TextEditingValue(text: UserController.usuarioLogado.bairro);
      userController.textControllerCACidade.value = TextEditingValue(text: UserController.usuarioLogado.cidade);
      userController.textControllerCACEP.value = TextEditingValue(text: UserController.usuarioLogado.cep);
      userController.textControllerCASenha.value = TextEditingValue(text: UserController.usuarioLogado.senha);
      UserController.nascimentoFinal = UserController.usuarioLogado.nascimento;
    }
  }
}
