import 'package:flutter/material.dart';
import 'package:flutter_dev/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final isGoogleSignInLoading = false.obs;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void signIn(String email, String password) {
    // Sign in user
    AuthenticationRepository.instance
        .signInWithEmailAndPassword(email, password);
  }

  Future<void> signInWithGoogle() async {
    // Sign in user with Google
    try {
      isGoogleSignInLoading.value = true;
      await AuthenticationRepository.instance.signInWithGoogle();
      isGoogleSignInLoading.value = false;
    } catch (e) {
      isGoogleSignInLoading.value = false;
      print('Error: $e');
    }
  }
}
