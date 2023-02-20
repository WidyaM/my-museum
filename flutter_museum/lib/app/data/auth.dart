import 'package:flutter_museum/app/data/user.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final userFirestore = Get.find<UserFirestore>();
  User? currentUser;

  AuthFirebase() {
    // Set current user
    currentUser = _firebaseAuth.currentUser;

    // Listen auth state changes
    _firebaseAuth.authStateChanges().listen((event) {
      currentUser = event;
    });
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signUp({
    required String email,
    required String password,
    required String fullName,
    required String address,
  }) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      userFirestore.updateUser(
        id: user.user!.uid,
        fullName: fullName,
        address: address,
        email: email,
      );

      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
