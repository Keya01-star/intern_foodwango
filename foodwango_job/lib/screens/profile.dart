import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/screens/Education.dart';
import 'package:foodwango_job/screens/aboutme.dart';
import 'package:foodwango_job/screens/interests.dart';
import 'package:foodwango_job/screens/personal_info.dart';
import 'package:foodwango_job/screens/skills.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/inter1.jpg'),
              ),
            ],
          ),
          Text(
            'Full Name',
            style: TextStyle(fontSize: 18, color: Color(0xFF21BFBD)),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
          ),
          Text(
            'phone number',
            style: TextStyle(fontSize: 16, color: Colors.black),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
          ),
          ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.edit),
            title: Text('About Me'),
            subtitle: Text('Click to fill about you'),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AboutMe();
                }));
              });
            },
          ),
          ListTile(
              leading: Icon(Icons.add_box),
              title: Text('Work Experience'),
              subtitle: Experience()),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Looking For Jobs In'),
            trailing: Icon(Icons.edit),
            subtitle: Text('Interested In'),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InterestedIn();
                }));
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Skills'),
            trailing: Icon(Icons.edit),
            subtitle: Text('skill'),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Skills();
                }));
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_file),
            title: Text('Certificates'),
            trailing: Icon(Icons.edit),
            subtitle: Text('Click to add certificates'),
            /* onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return Upload('Certificate Upload');
                    }));
              });

            },*/
          ),
          ListTile(
            leading: Icon(Icons.attach_file),
            title: Text('Resume'),
            trailing: Icon(Icons.edit),
            subtitle: Text('Click to add resume'),
            /* onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return Upload('Resume Upload');
                    }));
              });

            },*/
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Education & Qualification'),
            trailing: Icon(Icons.edit),
            subtitle: Text('Education'),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Education();
                }));
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Personal Information'),
            trailing: Icon(Icons.edit),
            subtitle: Text('Personal Info'),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Personal();
                }));
              });
            },
          ),
        ],
      ),
    );
  }
}
