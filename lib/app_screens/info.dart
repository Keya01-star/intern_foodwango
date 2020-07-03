import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/app_screens/interests.dart';

class info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return infoState();
  }
}

class infoState extends State<info> {
  var infoFormKey = GlobalKey<FormState>();

  var temp;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: Form(
          key: infoFormKey,
          autovalidate: true,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Text(
                  'Education',
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Center(
                    child: Gender(),
                  ),
                ),
                Text(
                  'My Gender',
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Center(child: Education())),
                Text(
                  'How I Speak English',
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Center(
                      child: English(),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          if (infoFormKey.currentState.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return InterestedIn();
                            }));
                          }
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
            ),
          )),
    );
  }
}

class Education extends StatefulWidget {
  @override
  _EducationState createState() => new _EducationState();
}

class _EducationState extends State<Education> {
  int _value = 1;

  List<String> education = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: List<Widget>.generate(
        3,
        (int index) {
          return ChoiceChip(
            label: Text(education[index],style: TextStyle(color:Colors.black ),),
            selectedColor: Color(0xFF21BFBD),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                if (_value != index) _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}

class Gender extends StatefulWidget {
  @override
  GenderState createState() => GenderState();
}

class GenderState extends State<Gender> {
  int _value = 1;

  List<String> gender = ['Below 10th', '10th Pass', '12th Pass', 'Graduate'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: List<Widget>.generate(
        4,
        (int index) {
          return ChoiceChip(
            label: Text(gender[index],style: TextStyle(color:Colors.black ),),
            selectedColor: Color(0xFF21BFBD),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                if (_value != index) _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}

class English extends StatefulWidget {
  @override
  EnglishState createState() => EnglishState();
}

class EnglishState extends State<English> {
  int _value = 1;

  List<String> english = [
    'No English',
    'Little English',
    'Good English',
    'Fluent English'
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: List<Widget>.generate(
        4,
        (int index) {
          return ChoiceChip(
            label: Text(english[index],style: TextStyle(color:Colors.black ),),
            selectedColor: Color(0xFF21BFBD),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                if (_value != index) _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}
