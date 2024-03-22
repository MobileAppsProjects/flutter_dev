import 'package:flutter/material.dart';
import 'package:flutter_dev/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void signIn(String email, String password) {
    // Sign in user
    AuthenticationRepository.instance
        .signInWithEmailAndPassword(email, password);
  }
}
