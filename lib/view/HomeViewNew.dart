import 'package:flutter/material.dart';
import 'package:yoga_app/view/pages_home/AgendView.dart';
import 'package:yoga_app/view/pages_home/ExercisesView.dart';
import 'package:yoga_app/view/pages_home/FeedView.dart';
import 'package:yoga_app/view/pages_home/ProfileView.dart';
import 'package:yoga_app/view/pages_home/TurmaView.dart';


class HomeViewNew extends StatefulWidget {
  final String title = "Sou Zen";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}

class _MyHomePageState extends State<HomeViewNew> {
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
                color: Colors.blueAccent,
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
                        Image.asset("images/logo_icon.png", width: MediaQuery.of(context).size.width - 200,),
                      ],
                    ),

                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Container(
                      height: 80,
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
          getGridView()
        ],
      ),
    );
  }


  Widget getGridView() {

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      primary: false,
      childAspectRatio: (MediaQuery
          .of(context)
          .size
          .width - 60 / 2) / 280,
      children: <Widget>[
        createTile(0,_selectedIndex,false, 'News', Colors.purple, Icons.rss_feed),
        createTile(1,_selectedIndex,true, 'Agenda', Colors.deepOrange, Icons.calendar_today),
        createTile(2,_selectedIndex,false, 'Meditação', Colors.redAccent, Icons.spa),
        createTile(3,_selectedIndex,true, 'Turma', Colors.lime, Icons.group_work),
        createTile(4,_selectedIndex,false, 'Exercícios', Colors.green, Icons.directions_run),
        createTile(5,_selectedIndex,true, 'Perfil', Colors.blue, Icons.person),
      ],
    );
  }
  int _selectedIndex = -1;
  Widget createTile(int index,int selectedIndex,bool isEven, String title, Color color, IconData icon) {

    return Padding(
      padding: EdgeInsets.only(
          left:  isEven?10:20, right: isEven?20:10, top: 10, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: (){
//            setState(() {
//              _selectedIndex = index;
//            });
            switch(index){
              case 0:
                //News
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedView()));
                break;
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AgendView()));
                break;
              case 2:
                //Meditacao
                break;
              case 3:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TurmaView()));
                break;
              case 4:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ExercisesView()));
                break;
              case 5:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
                break;
            }
          },
          child: Material(
            elevation: 3.0,
            color: _selectedIndex==index?Colors.lightBlueAccent:Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(icon,color: _selectedIndex==index?Colors.white:color, size: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _selectedIndex==index?Colors.white:Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:2.0),
                        child: Container(
                          height: 3.0,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: _selectedIndex==index?Colors.white:color,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
