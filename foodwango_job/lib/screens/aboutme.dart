import 'package:flutter/material.dart';
import 'package:foodwango_job/screens/profile.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Describe Yourself'),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              elevation: 6,
              child: Text('SAVE'),
              color: Color(0xFF21BFBD),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile();
                }));
              },
            ),
          )
        ],
      ),
    );
  }
}
