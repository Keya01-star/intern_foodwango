import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {

  Future<List<SkillName>> makeRequest() async {
    var response = await http.post(
        "https://skills.itsyourskills.com/oauth/token", headers: {
      "Accept": "application/json",
      "Content-type": "application/json",
    }, body: jsonEncode(<String, String>{
      "grant_type": "client_credentials",
      "client_id": "810",
      "client_secret": "TIN3WCClnxECz6mfOMzRweJrTbW2Qc70uG0CPeya"
    }));
    var res = json.decode(response.body);
    var finalResponse = await http.get(
        "https://skills.itsyourskills.com/api/skill-search?q=php developer",
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ' + res['access_token'],
          "Accept": "application/json",
          "Content-type": "application/json",
        });
    var skill_list = json.decode(finalResponse.body);
    List<SkillName> skills = [];
    for (var s in skill_list) {
        SkillName skill = SkillName(s["skill_name"]);
        skills.add(skill);
    }
    print(res);
    return skills;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills'),
      ),
      body: Container(
        child: FutureBuilder(
          future: makeRequest(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
                //itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  if(snapshot.data == null){
                    return Container(
                      child: Center(
                        child: Text('Loading...'),
                      ),
                    );
                  }
                  else{
                  return ListTile(
                    title: Text(snapshot.data[index].skill_name) ,
                  );
                }});
          },
        ),
      ),
    );
  }
}

class SkillName {
  final String name;

  SkillName(this.name);
}