import 'package:spend_flutter_app/src/core/localization/auth/sign_locale.dart';
import 'package:spend_flutter_app/src/core/localization/auth/sign_up_locale.dart';
import 'package:spend_flutter_app/src/core/localization/auth/welcome_locale.dart';
import 'package:spend_flutter_app/src/core/localization/settings_locale.dart';

mixin AppLocale {
  static final Map<String, dynamic> en = {
    ...WelcomeLocale.EN,
    ...SettingsLocale.EN,
    ...SignLocale.EN,
    ...SignUpLocale.EN,
  };

  static final Map<String, dynamic> es = {
    ...WelcomeLocale.ES,
    ...SettingsLocale.ES,
    ...SignLocale.ES,
    ...SignUpLocale.ES,
  };
}
