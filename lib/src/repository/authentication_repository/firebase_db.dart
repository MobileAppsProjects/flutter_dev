import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSingleton {
  static final FirebaseSingleton _singleton = FirebaseSingleton._internal();
  late final FirebaseAuth firebaseAuth;

  factory FirebaseSingleton() {
    return _singleton;
  }

  FirebaseSingleton._internal() {
    firebaseAuth = FirebaseAuth.instance;
  }
}
