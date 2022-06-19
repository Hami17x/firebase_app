import 'dart:async';

import 'package:firebase_app/auth/services/firebase_service.dart';
import 'package:firebase_app/auth/verified_email_provider.dart';
import 'package:firebase_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => VEProvider(),
        builder: (context, child) => context.watch<VEProvider>().isEmailVerified
            ? HomeView()
            : Scaffold(
                appBar: AppBar(
                  title: const Text("verify your email"),
                ),
              ));
  }

  //aşağıdaki kısımı provider ile yaptık.

  /*
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }
  

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomeView()
      : Scaffold(
          appBar: AppBar(
            title: Text("veriy your email"),
          ),
          body: Center(
            child: ElevatedButton(
                onPressed: () => FirebaseService.logout(),
                child: Text("çıkış yap")),
          ),
        );

        */
}
