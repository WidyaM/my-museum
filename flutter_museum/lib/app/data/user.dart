import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestore {
  final CollectionReference _userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> updateUser({
    required String id,
    required String fullName,
    required String address,
    required String email,
  }) async {

    _userCollection.doc(id).set({
      'fullName': fullName,
      'address': address,
      'email': email,
    });
  }

}
