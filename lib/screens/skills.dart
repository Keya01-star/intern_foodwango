import 'dart:convert';
import 'dart:async';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  final User userDb;

  Skills({Key key, @required this.userDb}) : super(key: key);

  @override
  _SkillsState createState() => _SkillsState(userDb: userDb);
}

class _SkillsState extends State<Skills> {
  final User userDb;
  List<String> skillList = [];

  _SkillsState({Key key, @required this.userDb}) : super();

//  Future<List<SkillName>> makeRequest() async {
//    var response =
//        await http.post("https://skills.itsyourskills.com/oauth/token",
//            headers: {
//              "Accept": "application/json",
//              "Content-type": "application/json",
//            },
//            body: jsonEncode(<String, String>{
//              "grant_type": "client_credentials",
//              "client_id": "810",
//              "client_secret": "TIN3WCClnxECz6mfOMzRweJrTbW2Qc70uG0CPeya"
//            }));
//    var res = json.decode(response.body);
//    var finalResponse = await http.get(
//        "https://skills.itsyourskills.com/api/skill-search?q=php developer",
//        headers: {
//          HttpHeaders.authorizationHeader: 'Bearer ' + res['access_token'],
//          "Accept": "application/json",
//          "Content-type": "application/json",
//        });
//    var skill_list = json.decode(finalResponse.body);
//    List<SkillName> skills = [];
//    for (var s in skill_list) {
//      SkillName skill = SkillName(s["skill_name"]);
//      skills.add(skill);
//    }
//    print(res);
//    return skills;
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Enter Your Skills'),
                onSubmitted: (value) {
                  skillList.add(value);
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                child: Text('Done',style: TextStyle(fontSize: 20),),
                onPressed: (){
                  userDb.skills=skillList;
                  Navigator.pop(context);
                },)
            ],
          ),
        ),
      ),
    );
  }
}


