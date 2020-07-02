import 'package:flutter/material.dart';
import 'package:jobseeker/app_screens/profile.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List details = ['Profile', 'My Jobs', 'Log out'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('My Account'),
          backgroundColor: Color(0xFF21BFBD),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){return Profile();} ));
              },
            ),
            jobs(),
            logout()
          ],
        )
    );
  }

  Widget jobs() {
    return ListTile(
      leading: Icon(Icons.add_box),
      title: Text('My Jobs'),
      trailing: Icon(Icons.navigate_next),
    );
  }

  Widget logout() {
    return ListTile(
      leading: Icon(Icons.play_circle_outline),
      title: Text('Logout'),
      trailing: Icon(Icons.navigate_next),

    );
  }
}

