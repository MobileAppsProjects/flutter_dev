import 'package:flutter/material.dart';
import 'package:flutter_dev/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  TextEditingController get userController => _userController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void register(String email, String password) {
    // Register user
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
