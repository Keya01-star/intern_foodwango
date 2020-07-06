import 'package:flutter/material.dart' show BorderSide, BuildContext, Color, Colors, Column, EdgeInsets, FontWeight, Form, FormState, GlobalKey, Icon, Icons, InputDecoration, MainAxisAlignment, Navigator, Padding, Radio, RaisedButton, Row, Scaffold, SingleChildScrollView, SizedBox, State, StatefulWidget, Text, TextFormField, TextInputType, TextStyle, UnderlineInputBorder, Widget;
import 'package:foodwango_job/services/auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  String name;
  String error = '';
  bool showSpinner = false;
  List position = ["Job Seeker", "Job Recruiter"];
  String select;
  final Authservice _auth = Authservice();
  final _formKey = GlobalKey<FormState>();
  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.black,
          value: position[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title, style: TextStyle(color: Colors.black)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text('Register',
                    style: TextStyle(
                      color: Color(0xFF21BFBD),
                      fontSize: 30.0,
                    )),
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    //style: kTextStyle,
                    style: TextStyle(color: Colors.black),
                    //textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                        labelText: 'email',
                        icon: Icon(
                          Icons.email,
                          color: Color(0xFF21BFBD),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF21BFBD))))),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter your name' : null,
                  //style: kTextStyle,
                  //textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    name = value;
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                      labelText: 'Name',
                      icon: Icon(
                        Icons.person,
                        color: Color(0xFF21BFBD),
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF21BFBD)))),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+character' : null,
                  //style: kTextStyle,
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  //textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color(0xFF21BFBD),
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF21BFBD)))
                          ),
                ),
                SizedBox(
                  height: 50.0,
                ),
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
                    Column(
                      children: <Widget>[
                        addRadioButton(0, "Job Seeker"),
                        addRadioButton(1, "Job Recruiter"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                RaisedButton(
                  child: Text('Register'),
                  color: Color(0xFF21BFBD),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser = await _auth.regInWithEmail(
                            email, password, name, select);
                        if (newUser == null) {
                          //Navigator.pushNamed(context, ChatScreen.id);
                          //print('cant register');
                          setState(() {
                            error =
                                'Cannot register with given email and password';
                          });
                        } else {
                          Navigator.pop(context);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                ),
                SizedBox(height: 8.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
