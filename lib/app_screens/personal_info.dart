import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobseeker/app_screens/info.dart';
import 'package:jobseeker/app_screens/profile.dart';

class Personal extends StatefulWidget {
  @override
  PersonalState createState() => PersonalState();
}

class PersonalState extends State<Personal> {
  DateTime dateB = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Information'),
          backgroundColor: Color(0xFF21BFBD),
        ),
        body: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Mobile Number'),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email-ID'),
            ),
            /*TextField(
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),*/
            TextField(
              decoration: InputDecoration(labelText: 'Languages Known'),
            ),
            new FlatButton(
              child: new Row(
                children: <Widget>[
                  new Text(
                    '${formatDate(dateB, [dd, '/', mm, '/', yyyy]) + "  "}',
                    style:
                        new TextStyle(color: Color(0xFF21BFBD), fontSize: 20),
                  ),
                  new Icon(Icons.calendar_today),
                  new Text(
                    'Enter Birth Year',
                    style: TextStyle(fontSize: 10.0),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
              onPressed: () async {
                final dtPick = await showDatePicker(
                    context: context,
                    initialDate: dateB,
                    firstDate: DateTime(DateTime.now().year - 35),
                    lastDate: DateTime(DateTime.now().year + 10));
                if (dtPick != null) {
                  setState(() {
                    dateB = dtPick;
                  });
                }
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'My Gender',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Center(child: Education())),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                    });
                  },
                  color: Color(0xFF21BFBD),
                  child: Text(
                    'SAVE',
                  ),
                  elevation: 6.0,
                ),
              ),
            )
          ],
        ));
  }
}
