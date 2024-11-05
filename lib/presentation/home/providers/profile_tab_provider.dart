import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProfileTabProvider extends ChangeNotifier {
  User? get currentUser => FirebaseAuth.instance.currentUser;
}
