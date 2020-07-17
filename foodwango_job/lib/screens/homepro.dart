import 'package:flutter/material.dart';
import 'package:foodwango_job/screens/account.dart';
import 'package:foodwango_job/screens/interview.dart';
import 'package:foodwango_job/screens/Onlinecourse.dart';

class Homepro extends StatefulWidget {
  @override
  _HomeproState createState() => _HomeproState();
}

class _HomeproState extends State<Homepro> {
  String val = "false";
  bool pop;

  @override
  Widget build(BuildContext context) {
    int next = 0;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Foodwagon",
          style: TextStyle(fontSize: 18.0),
        ),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF21BFBD),
        unselectedItemColor: Colors.black,
        currentIndex: next,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Color(0xFF21BFBD),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              backgroundColor: Color(0xFF21BFBD)),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv),
              title: Text('Courses'),
              backgroundColor: Color(0xFF21BFBD)),
          BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              title: Text('Interview Tips'),
              backgroundColor: Color(0xFF21BFBD)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('My Account'),
              backgroundColor: Color(0xFF21BFBD)),
        ],
        onTap: (int index) {
          setState(() {
            next = index;
             if (next == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Onlinecourse();
              }));
            }
            if (next == 3) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Interview();
              }));
            }
            if (next == 4) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Account();
              }));
            }
          });
        },
      ),
    );
  }
}
