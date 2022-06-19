import 'package:email_validator/email_validator.dart';
import 'package:firebase_app/auth/pages/forgot_password_page.dart';
import 'package:firebase_app/auth/pages/signup_page.dart';
import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final _ec = TextEditingController();
  final _pc = TextEditingController();

  @override
  void dispose() {
    _ec.dispose();
    _pc.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _ec,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: "email"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? "Enter valid  email"
                        : null,
              ),
              TextFormField(
                controller: _pc,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "password"),
                validator: (value) => value != null && value.length < 6
                    ? " Enter min 6 characters"
                    : null,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    FirebaseService.signin(
                        formKey, _ec.text.trim(), _pc.text.trim());
                  },
                  icon: const Icon(
                    Icons.login,
                    size: 25,
                  ),
                  label: Text("Sign in")),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage())),
                child: Text("u forgot password?"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupView()),
                    );
                  },
                  child: const Text("no account? Signup"))
            ],
          ),
        ),
      ),
    );
  }
}
