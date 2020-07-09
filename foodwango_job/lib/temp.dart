import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:foodwango_job/screens/homescreen.dart';
import 'package:foodwango_job/screens/seeker.dart';
import 'package:foodwango_job/screens/recruiter.dart';
import 'package:foodwango_job/screens/seekerpro.dart';
import 'package:spinner/spinner.dart';
//import 'package:foodwango_job/services/auth.dart';
import 'package:foodwango_job/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Temp extends StatelessWidget {
  String id;
  Temp({this.id});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            //SizeConfig().init(constraints, orientation);
            return StreamProvider<QuerySnapshot>.value(
              value: DatabaseService().users,
              child: Container(
                child: MyMainPage(
                  uid: id,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class MyMainPage extends StatefulWidget {
  // MyMainPage({Key key, this.title}) : super(key: key);

  //final String title;
  String uid;
  MyMainPage({this.uid});

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    final users = Provider.of<QuerySnapshot>(context);

    String select, proselect;
    if (users != null) {
      for (var doc in users.documents) {
        if (doc.data['uid'] == widget.uid) {
          select = doc.data['select'];
          proselect = doc.data['proselect'];
        }
      }

      if (select == 'Job Seeker' && proselect == 'Pro User') {
        return Seekerpro(
          uid: widget.uid,
        );
      } else if (select == 'Job Seeker' && proselect == 'Normal User') {
        return Seeker(
          uid: widget.uid,
        );
      } else if (select == 'Job Recruiter') {
        return Recruiter(
          uid: widget.uid,
        );
      }
    } else {
      return Scaffold(
        backgroundColor: Color(0xFF21BFBD),
      );
    }
  }
}
