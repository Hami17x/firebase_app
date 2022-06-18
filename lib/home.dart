import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.email ?? ""),
            ElevatedButton.icon(
                onPressed: logout,
                icon: Icon(Icons.logout),
                label: Text("logout"))
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
