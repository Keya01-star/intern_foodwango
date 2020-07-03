import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:foodwango_job/screens/info.dart';
import 'package:foodwango_job/services/auth.dart';
import 'package:foodwango_job/services/database.dart';
import 'package:provider/provider.dart';
import 'package:foodwango_job/screens/interests.dart';

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
