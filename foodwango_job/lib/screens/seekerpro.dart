import 'package:flutter/material.dart';

import 'package:foodwango_job/screens/homepro.dart';

class Seekerpro extends StatefulWidget {
  final String uid;
  Seekerpro({this.uid});

  _SeekerproState createState() => _SeekerproState();
}

class _SeekerproState extends State<Seekerpro> {
  Widget build(BuildContext context) {
    return Homepro();
  }
}
