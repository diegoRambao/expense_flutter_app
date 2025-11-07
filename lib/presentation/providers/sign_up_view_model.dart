import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool showPassword = false;

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  bool validatePasswords() {
    return passwordController.text == confirmPasswordController.text;
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
