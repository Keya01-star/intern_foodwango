import 'package:flutter/material.dart';
import 'package:jobseeker/app_screens/account.dart';

import './app_screens/info.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Foodwagon',
      debugShowCheckedModeBanner: false,
      home: info(),
    );
  }
}