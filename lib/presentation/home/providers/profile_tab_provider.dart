import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProfileTabProvider extends ChangeNotifier {
  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
