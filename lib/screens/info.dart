import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/interests.dart';
import 'home.dart';
import 'interests.dart';

class info extends StatefulWidget {
  final User userDb;
  info({Key key, @required this.userDb}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return infoState(userDb: userDb);
  }
}

class infoState extends State<info> {
  final User userDb;
  infoState({Key key, @required this.userDb}) : super();

  List user = ["Normal User", "Pro User"];
  int group = 1;
  String select, education, english, gender;

/*_sendToServer(){
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  var data = {
    "normalOrPro":select,
   // "education":education,
   // "english":english,
    "gender": gender
  };
  ref.child('node-name').push().set(data);
}*/

  Row addRadioButton(int btnValue, String title, String radio) {
    if (radio == 'true') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new InkWell(
            child: Radio(
              activeColor: Theme.of(context).primaryColor,
              value: user[btnValue],
              groupValue: select,
              onChanged: (value) {
                setState(() {
                  print(value);
                  select = value;
                  userDb.seekerType = value;
                  User(seekerType: select);
                  print(userDb.seekerType);
                  _showDialog();
                });
              },
            ),
          ),
          Text(title)
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: user[btnValue],
            groupValue: select,
            onChanged: (value) {
              setState(() {
                print(value);
                select = value;
                userDb.seekerType = value;
                User(seekerType: select);
              });
            },
          ),
          Text(title)
        ],
      );
    }
  }

  var infoFormKey = GlobalKey<FormState>();

  var temp;
  bool radiobutton = false;
  String val = "false";

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
                    child: Gender(userDb: userDb,),
                  ),
                ),
                Text(
                  'My Gender',
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Center(child: Education(userDb: userDb,))),
                Text(
                  'How I Speak English',
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Center(
                      child: English(userDb: userDb,),
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      'Are you a?? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          fontSize: 16.0),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: <Widget>[
                        addRadioButton(0, 'Normal User', 'false'),
                        addRadioButton(1, 'Pro User', 'true'),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: RaisedButton(
                      onPressed: () {
                        //_sendToServer();
                        setState(() {
                          if (infoFormKey.currentState.validate()) {
                            if (select == 'Pro User') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return InterestedIn(user:'Pro', userDb: userDb);
                              }));
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return InterestedIn(user:'Normal', userDb: userDb);
                              }));
                            }
                          }
                          if (val == "true") {
                            Navigator.pop(context, select);
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

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: new _SystemPadding(
        child: new AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'Pro User Code',
                      hintText: 'A6fhd9',
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF21BFBD)))),
                ),
              )
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                color: Color(0xFF21BFBD),
                child: const Text(
                  'DONE',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  //_sendToServer();
                  if (select == 'Pro User') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InterestedIn(user: 'Pro', userDb: userDb);
                    }));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home(userDb: userDb);
                    }));
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class Education extends StatelessWidget {
  int _value;
  final User userDb;

  Education({Key key, @required this.userDb}) : super(key: key);
  final List<String> education = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: List<Widget>.generate(
        3,
        (int index) {
          return ChoiceChip(
            label: Text(
              education[index],
              style: TextStyle(color: Colors.black),
            ),
            selected: _value == index,
            selectedColor: Color(0xFF21BFBD),
            onSelected: (bool selected) {
              //setState(() {
                if (_value != index) _value = selected ? index : null;
                userDb.gender = education[_value];
                return education[_value];
              //});
            },
          );
        },
      ).toList(),
    );
  }
}

class Gender extends StatelessWidget {
  int _value ;
  final User userDb;

  Gender({Key key, @required this.userDb}) : super(key: key);
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
            label: Text(
              gender[index],
              style: TextStyle(color: Colors.black),
            ),
            selected: _value == index,
            selectedColor: Color(0xFF21BFBD),
            onSelected: (bool selected) {
              // setState(() {
              if (_value != index) _value = selected ? index : null;
              userDb.education = gender[_value];
              return gender[_value];
              //});
            },
          );
        },
      ).toList(),
    );
  }
}

class English extends StatelessWidget {
  int _value ;
  final User userDb;

  English({Key key, @required this.userDb}) : super(key: key);
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
            label: Text(
              english[index],
              style: TextStyle(color: Colors.black),
            ),
            selected: _value == index,
            selectedColor: Color(0xFF21BFBD),
            onSelected: (bool selected) {
              //setState(() {
              if (_value != index) _value = selected ? index : null;
              //userDb.english = english[_value];
              User(english: english[_value]);
              return english[_value];
              //});
            },
          );
        },
      ).toList(),
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
}
*/
class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        // padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
