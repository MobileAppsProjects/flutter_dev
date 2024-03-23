import 'dart:async';

import 'package:flutter_dev/main.dart';
import 'package:flutter_dev/src/features/login/screens/login_screen.dart';
import 'package:flutter_dev/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dev/src/features/root/my_home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepositoryFactory {
  static AuthenticationRepository? _instance;

  static AuthenticationRepository get instance {
    _instance ??= AuthenticationRepository._internal();
    return _instance!;
  }
}

class AuthenticationRepository extends GetxController {

  static AuthenticationRepository? _instance;

  AuthenticationRepository._internal();

  static AuthenticationRepository get instance =>  AuthenticationRepositoryFactory.instance;

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // return to login screen
    } else {
      
      // return to home screen
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => MyHomePage())
          : Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      // handle error
      final ex = SignUpEmailPasswordFailure.code(e.code);
      print('Error: ${ex.message}');
      throw ex;
    } catch (_) {
      // handle error
      const ex = SignUpEmailPasswordFailure();
      print('Error: ${ex.message}');
      throw ex;
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => MyHomePage())
          : Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      // handle error
      final ex = SignUpEmailPasswordFailure.code(e.code);
      print('Error: ${ex.message}');
      throw ex;
    } catch (_) {
      // handle error
      const ex = SignUpEmailPasswordFailure();
      print('Error: ${ex.message}');
      throw ex;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      // handle error
      final ex = SignUpEmailPasswordFailure.code(e.code);
      print('Error: ${ex.message}');
      throw ex;
    } catch (_) {
      // handle error
      const ex = SignUpEmailPasswordFailure();
      print('Error: ${ex.message}');
      throw ex;
    }
  }

  Future signOut() async {
    if (firebaseUser.value!.providerData[0].providerId == 'google.com') {
      await GoogleSignIn().signOut();
    }
    await _auth.signOut();
    Get.offAll(() => LoginScreen());
  }
}
