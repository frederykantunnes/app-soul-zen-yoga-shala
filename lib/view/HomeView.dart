import 'package:flutter/material.dart';
import 'package:yoga_app/view/ProfileView.dart';
import 'package:yoga_app/view/pages_home/AgendView.dart';
import 'package:yoga_app/view/pages_home/ExercisesView.dart';
import 'package:yoga_app/view/pages_home/FeedView.dart';
import 'package:yoga_app/view/pages_home/TurmaView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: new Center(
          child: Padding(
            padding: EdgeInsets.only(left: 90,),
            child: Image.asset(
              'images/logo_icon.png',
              height: 45,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.only(left: 30),
            child: Icon(Icons.settings),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          )
        ],
        elevation: 15,
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            title: Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Agenda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            title: Text('Turma'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            title: Text('Exercícios'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: (index)  {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

    );
  }


  static List<Widget> _widgetOptions = <Widget>[
    FeedView(),
    AgendView(),
    TurmaView(),
    ExercisesView()
  ];
}
