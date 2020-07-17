import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/Education.dart';
import 'package:foodwango_job/screens/aboutme.dart';
import 'package:foodwango_job/screens/interests.dart';
import 'package:foodwango_job/screens/personal_info.dart';
import 'package:foodwango_job/screens/skills.dart';
import 'package:foodwango_job/screens/uploadFile.dart';
import 'package:foodwango_job/utils/database_helper.dart';

class Profile extends StatefulWidget {
  final User userDb;
  Profile({Key key, @required this.userDb}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState(userDb: userDb);
}


class _ProfileState extends State<Profile> {
  final User userDb;
  _ProfileState({Key key, @required this.userDb}) : super();

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
          /*Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/inter1.jpg'),

              ),
              IconButton(icon: Icon(Icons.camera_alt), onPressed: () { uploadImage(userDb: userDb,title: 'Picture',) ;},)
            ],
          ),
          Text(
            'name',
            style: TextStyle(fontSize: 18, color: Color(0xFF21BFBD)),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
          ),
            Text(
              userDb.mobile,
              style: TextStyle(fontSize: 16, color: Colors.black),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
          */

          ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.edit),
            title: Text('About Me'),

            subtitle: Text('Click to fill about you'),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AboutMe(userDb:userDb);
                }));
              });
            },
          ),
          /*Row(
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.add_box,
                color: Colors.grey,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Work Experience',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Container(
                height: 100,
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: <Widget>[
                    Experience(userDb: userDb,)
                  ],
                )),
          ),*/
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Looking For Jobs In'),
            trailing: Icon(Icons.edit),
            subtitle: Text('Interested In'),
            /*onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InterestedIn();
                }));
              });
            },*/
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
             onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return uploadImage(userDb: userDb,title: 'Certificate',);
                    }));
              });

            },
          ),
          ListTile(
            leading: Icon(Icons.attach_file),
            title: Text('Resume'),
            trailing: Icon(Icons.edit),
            subtitle: Text('Click to add resume'),
             onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return uploadImage(title:'Resume',userDb: userDb,);
                    }));
              });

            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Education & Qualification'),
            trailing: Icon(Icons.edit),
            subtitle: Text('Education'),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Education(userDb:userDb);
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
                  return Personal(userDb:userDb);
                }));
              });
            },
          ),
        ],
      ),
    );
  }

}
/*
class choiceChipWidget extends StatefulWidget {
  final List<String> reportList;

  choiceChipWidget(this.reportList);

  @override
  _choiceChipWidgetState createState() => new _choiceChipWidgetState();
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xffededed),
          selectedColor: Color(0xFF21BFBD),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}*/