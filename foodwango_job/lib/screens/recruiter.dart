import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodwango_job/services/auth.dart';
import 'package:foodwango_job/services/database.dart';
import 'package:provider/provider.dart';
import 'package:foodwango_job/screens/homescreen.dart';
import 'package:foodwango_job/screens/job_description.dart';
import 'package:foodwango_job/screens/company_details.dart';

class Recruiter extends StatefulWidget {
  final String uid;
  Recruiter({this.uid});
  _RecruiterState createState() => _RecruiterState();
}

class _RecruiterState extends State<Recruiter> {
  final Authservice _auth = Authservice();
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => homescreen(),
        '/second': (context) => jobdescription(),
        '/third': (context) => companydetails(),
      },
      title: 'recruiter',

      debugShowCheckedModeBanner: false,

      // home:homescreen(),
    );
  }
}
