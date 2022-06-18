import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _ec = TextEditingController();
  final _pc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _ec,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "email"),
            ),
            TextField(
              controller: _pc,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "password"),
            ),
            ElevatedButton.icon(
                onPressed: signUp,
                icon: Icon(
                  Icons.login,
                  size: 25,
                ),
                label: Text("Create account")),
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _ec.text.trim(), password: _pc.text.trim())
          .then((value) => Navigator.pop(context));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
