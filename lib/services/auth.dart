import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User get currentUser;
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => _firebaseAuth.currentUser;

}