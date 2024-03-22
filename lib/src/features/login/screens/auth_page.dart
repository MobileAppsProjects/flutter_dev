import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/src/features/home/screens/home_screen.dart';
import 'package:flutter_dev/src/features/login/screens/login_screen.dart';
import 'package:flutter_dev/src/features/root/my_home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              //user is logged in
              if (snapshot.hasData) {
                return MyHomePage();
              } else {
                return LoginScreen();
              }
            }));
  }
}
