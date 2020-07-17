import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  /*List<File> certificates;
  File resume;*/
  String photoUrl;
  String certUrl, resumeUrl;
  String uid;
  List skills;
  String email;
  String name;
  List interests;
  List myJobs;
  String aboutMe;
  String workExp;
  String schoolName;
  String collegeName;
  DateTime dob;
  DateTime collegeDate;
  DateTime schoolDate;
  String mobile;
  List languages;
  String collegeDegree;
  String userType;
  String seekerType;
  String english;
  String education;
  String gender;

  //String get getUid => uid;

  String get getEmail => email;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'userType': userType,
        'interests': interests,
        'myJobs': myJobs,
        'certificates': certUrl,
        'resume': resumeUrl,
        'photo': photoUrl,
        'aboutMe': aboutMe,
        'workExp': workExp,
        'schoolName': schoolName,
        'collegeName': collegeName,
        'birthDate': dob,
        'collegeEndYear': collegeDate,
    'skills':skills,
        'schoolEndYear': schoolDate,
        'mobile': mobile,
        'languages': languages,
        'collegeDegree': collegeDegree,
        'seekerType': seekerType,
        'english': english,
        'education': education,
        'gender': gender
      };

  FirebaseAuth _auth = FirebaseAuth.instance;
Future<String> getCurrentUID()async{
  return (await _auth.currentUser()).uid;
}
  Future<bool> signUp(String email, String password) async {
    bool retVal = false;
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        retVal = true;
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<bool> Login(String email, String password) async {
    bool retVal = false;
    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        retVal = true;
        uid = _authResult.user.uid;

        email = _authResult.user.email;
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  User({
    this.uid,
    this.email,
    this.name,
    this.interests,
    this.myJobs,
    this.aboutMe,
    this.workExp,
    this.schoolName,
    this.collegeName,
    this.dob,
    this.skills,
    this.collegeDate,
    this.schoolDate,
    this.mobile,
    this.languages,
    this.collegeDegree,
    this.seekerType,
    this.english,
    this.education,
    this.userType,
    this.gender,
    this.resumeUrl,
      this.certUrl,
    this.photoUrl
  });

  updatePic(picUrl) async{
    var userInfo = new UserUpdateInfo();
    userInfo.photoUrl=picUrl;
    //await FirebaseAuth.instance.updateProfile(userInfo).then((val){
      FirebaseAuth.instance.currentUser().then((user){
        Firestore.instance.collection('/users').where('uid',isEqualTo: user.uid).getDocuments().then((docs){

          Firestore.instance.document('/users/${docs.documents[0].documentID}').updateData({'photoUrl':picUrl}).then((value){
            print('Updated');
          });
        });
      });
    //});
  }
}

class Recruiter extends StatelessWidget {
  String role, name, userType, minSal, maxSal, city, locality, staff, uid,qualification,workExp;
  User userDb;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Recruiter(
      {this.role,
      this.name,
        this.qualification,
      this.userType,
        this.workExp,
      this.minSal,
      this.maxSal,
      this.city,
      this.locality,
      this.staff,
      this.uid});

  @override
  Widget build(BuildContext context) {
    uid = userDb.uid;
    Map<String, dynamic> toJson() => {
          'uid': uid,
          'name': name,
          'userType': userType,
          'minSal': minSal,
          'maxSal': maxSal,
          'city': city,
          'locality': locality,
          'staff': staff
        };
  }

  saveRecruiterData()async{
    final FirebaseUser user = await auth.currentUser();
    userDb.uid = user.uid;
    //await db.collection('userData').document(userDb.uid)..collection('users').add(userDb.toJson());
    final CollectionReference userCollection =
    Firestore.instance.collection('UserData');
    await userCollection.document(userDb.uid).setData({
      'uid': uid,
      'name': name,
      'userType': userType,
      'minSal': minSal,
      'maxSal': maxSal,
      'workExp':workExp,
      'qualification':qualification,
      'seekerType':'Job Recruiter',
      'city': city,
      'locality': locality,
      'staff': staff
    });
  }
}
