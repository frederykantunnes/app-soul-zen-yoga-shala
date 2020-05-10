import 'package:flutter/material.dart';
import 'package:yoga_app/model/FinanceModel.dart';


class FinanceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Financeiros'),
      ),
      body: FutureBuilder(
        future: FinanceClass().fetchFinance(),
        builder: (context, projectSnap) {
          if(projectSnap.data == null){
            return Container(
              child: Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 10,),
                    Text("Buscando Dados Financeiros..." )
                  ],
                ),
              ),
            );
          }


          return ListView.builder(
            itemCount: projectSnap.data == null ? 0 : projectSnap.data.length,
            itemBuilder: (context, index) {
              FinanceClass finance = projectSnap.data[index];
              return Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
                child: Column(
                  children: <Widget>[
                    Table(
//                  border: TableBorder(bottom: Border.all()),
                      children: [
                        TableRow(
                            children: [
                              TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Mês Referência"),
                                        Text(finance.mes_ref.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.blueAccent),)
                                      ],
                                    ),
                                  )
                              ),
                              TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Valor"),
                                        Text(finance.valor.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.grey),)
                                      ],
                                    ),
                                  )
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Vencimento"),
                                        Text(finance.getVencimento(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),)
                                      ],
                                    ),
                                  )
                              ),

                              TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Pago em"),
                                        Text(finance.getPagamento(), style: TextStyle(fontSize: 16),)
                                      ],
                                    ),
                                  )
                              ),
                            ]
                        )

                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-10,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                )
              );
            },
          );
        },
      ),
    );
  }
}
