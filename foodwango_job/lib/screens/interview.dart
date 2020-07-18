import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Interview extends StatefulWidget {
  @override
  _InterviewState createState() => _InterviewState();
}

class _InterviewState extends State<Interview> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 400,
      alignment: Alignment.center,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/images/inter1.jpg'),
          AssetImage('assets/images/inter2.jpg'),
          AssetImage('assets/images/inter3.jpg'),
          AssetImage('assets/images/inter4.jpg'),
          AssetImage('assets/images/inter5.jpg'),
        ],
      ),
    );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Interview Tips'),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: ListView(
        children: <Widget>[image_carousel],
      ),
    );
  }
}
