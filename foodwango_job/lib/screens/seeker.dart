import 'package:flutter/material.dart';

import 'package:foodwango_job/screens/info.dart';

class Seeker extends StatefulWidget {
  final String uid;
  Seeker({this.uid});

  _SeekerState createState() => _SeekerState();
}

class _SeekerState extends State<Seeker> {
  Widget build(BuildContext context) {
    return info();
  }
}
