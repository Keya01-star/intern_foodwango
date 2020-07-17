import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/screens/profile.dart';
import 'package:foodwango_job/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodwango_job/models/SeekerDb.dart';

class Account extends StatefulWidget {
  final User userDb;

  Account({Key key, @required this.userDb}) : super(key: key);

  @override
  _AccountState createState() => _AccountState(userDb: userDb);
}

class _AccountState extends State<Account> {
  final Authservice _auth = Authservice();
  final db = Firestore.instance;
  final User userDb;
  final FirebaseAuth auth = FirebaseAuth.instance;

  _AccountState({Key key, @required this.userDb}) : super();
  List details = ['Profile', 'My Jobs', 'Log out'];
  bool pop;

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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile(userDb: userDb);
                }));
              },
            ),
            jobs(),
            GestureDetector(
                onTap: () async {
                  final FirebaseUser user = await auth.currentUser();
                   userDb.uid = user.uid;
                  //await db.collection('userData').document(userDb.uid)..collection('users').add(userDb.toJson());
                  final CollectionReference userCollection =
                      Firestore.instance.collection('UserData');
                  await userCollection.document(userDb.uid).setData(userDb.toJson());
                  _auth.signOut();
                  signout();
                },
                child: ListTile(
                  leading: Icon(Icons.play_circle_outline),
                  title: Text('Logout'),
                  trailing: Icon(Icons.navigate_next),
                )),
          ],
        ));
  }

  Widget jobs() {
    return ListTile(
      leading: Icon(Icons.work),
      title: Text('My Jobs'),
      trailing: Icon(Icons.navigate_next),
    );
  }

  signout() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }
}
