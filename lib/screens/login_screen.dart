import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/RecruiterHome.dart';
import 'package:foodwango_job/screens/home.dart';
import 'package:foodwango_job/screens/homepro.dart';
import 'package:foodwango_job/screens/homescreen.dart';

import 'package:foodwango_job/screens/registration_screen.dart';
import 'package:foodwango_job/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  /*final User userDb;

  LoginScreen({Key key, @required this.userDb}) : super(key: key);*/

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User userDb;
Recruiter recDb;
/*
  _LoginScreenState({Key key, @required this.userDb}) : super();*/

  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  String name, email, password;

  String error = '';
  bool showSpinner = false;
  final Authservice _auth = Authservice();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String userType;
  String seekerType;

  Future<void> signIn() async {

    final formstate = _formKey.currentState;
    if (formstate.validate()) {
      formstate.save();
      FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
authorizeAccess(context);

    }
  }
  authorizeAccess(BuildContext context)async{
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    print(uid);
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance.collection('/UserData').where('uid',isEqualTo: uid).getDocuments().then((docs){
        if(docs.documents[0].exists){
          if(docs.documents[0].data['seekerType']=='Normal User'){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    Home(
                      userDb: userDb,
                    )));
          }
          if(docs.documents[0].data['seekerType']=='Pro User'){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    Homepro(
                      userDb: userDb,
                    )));
          }
          if(docs.documents[0].data['userType']=='Job Recruiter'){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    RecruiterHome(
                      recDb: recDb,
                    )));
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<User>(
            create: (context) {
              return User();
            },
          ),
        ],
        child: Scaffold(
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
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/foodwagon.png"),
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text('Log In',
                        style: TextStyle(
                          color: Color(0xFF21BFBD),
                          fontSize: 30.0,
                        )),
                    SizedBox(
                      height: 48.0,
                    ),
                    TextFormField(
                        controller: emailControl,
                        validator: (val) =>
                        val.isEmpty ? 'Enter an email' : null,
                        onSaved: (input) => email = input,
                        //style: kTextStyle,
                        style: TextStyle(color: Colors.black),
                        //textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        /*onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },*/
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
                                borderSide:
                                BorderSide(color: Color(0xFF21BFBD))))),
                    SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      controller: passwordControl,
                      validator: (val) =>
                      val.length < 6
                          ? 'Enter a password 6+character'
                          : null,
                      onSaved: (input) => password = input,

                      //style: kTextStyle,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      //textAlign: TextAlign.center,
                      /*onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },*/
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
                              borderSide:
                              BorderSide(color: Color(0xFF21BFBD)))),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    RaisedButton(
                      child: Text('Log In'),
                      color: Color(0xFF21BFBD),
                      /*onPressed: () async {
                    print(email);
                    print(password);
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser =
                            await _auth.signInWithEmail(email, password);
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
                  },*/
                      onPressed: () {
                        //_loginUser(emailControl.text, passwordControl.text, context);
                        signIn();
                      },
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Dont have an account ?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => RegistrationScreen()));
                      },
                      child: Text('Sign up here',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15.0,
                            letterSpacing: 1.0,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
