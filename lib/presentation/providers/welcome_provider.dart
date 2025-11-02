import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier {
  bool showSignUp = false;

  void toggleSignUp() {
    showSignUp = !showSignUp;
    notifyListeners();
  }
}
