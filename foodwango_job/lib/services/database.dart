import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  //collection ref
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String select) async {
    return await userCollection
        .document(uid)
        .setData({'select': select, 'uid': uid});
  }

  //Stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
