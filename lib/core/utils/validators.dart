import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:spend_flutter_app/core/localization/sign_up_locale.dart';

class AppValidators {
  static String? requiredField(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return SignUpLocale.errorEmptyField.getString(context);
    }
    return null;
  }

  static String? email(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return SignUpLocale.errorEmptyField.getString(context);
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return SignUpLocale.errorInvalidEmail.getString(context);
    }
    return null;
  }

  static String? password(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return SignUpLocale.errorEmptyField.getString(context);
    }
    if (value.length < 8) {
      return SignUpLocale.errorWeakPassword.getString(context);
    }
    return null;
  }
}
