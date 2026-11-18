import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isSignedIn = false;
  String userName = '';

  void signIn(String name) {
    userName = name;
    isSignedIn = true;
    notifyListeners();
  }

  void signOut() {
    userName = '';
    isSignedIn = false;
    notifyListeners();
  }
}
