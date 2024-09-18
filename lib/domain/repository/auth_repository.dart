import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthRepository {
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  Future<void> verifyEmail(String email) async {
    if (_firebaseAuth.currentUser?.emailVerified ?? false) return;
    await _firebaseAuth.currentUser?.sendEmailVerification();
    await _firebaseAuth.currentUser?.reload();
  }

  Future<User?> registerWithEmailAndPassword(String email, String password, {String? name}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await _firebaseAuth.currentUser?.updateDisplayName(name);
    await _firebaseAuth.currentUser?.reload();
    await verifyEmail(email);
    return _firebaseAuth.currentUser;
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    await _firebaseAuth.currentUser?.reload();
    await verifyEmail(email);
    return _firebaseAuth.currentUser;
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
