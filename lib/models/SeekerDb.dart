import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  /*List<File> certificates;
  File resume;*/
  String uid;
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
        /*'certificates': certificates,
        'resume': resume,*/
        'aboutMe': aboutMe,
        'workExp': workExp,
        'schoolName': schoolName,
        'collegeName': collegeName,
        'birthDate': dob,
        'collegeEndYear': collegeDate,
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
    /*this.resume,
      this.certificates*/
  });
}

class Recruiter extends StatelessWidget {
  String role, name, userType, minSal, maxSal, city, locality, staff, uid;
  User userDb;

  Recruiter(
      {this.role,
      this.name,
      this.userType,
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
}
