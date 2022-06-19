import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseService {
  static Future<void> signin(
      GlobalKey<FormState> formKey, String email, String password) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    /*
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
            */
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    // navigatorKey.currentState!.popUntil((route) => true);
  }

  static Future<void> signUp(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pop(context));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
