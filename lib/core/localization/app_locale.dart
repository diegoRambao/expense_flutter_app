import 'package:spend_flutter_app/core/localization/settings_locale.dart';
import 'package:spend_flutter_app/core/localization/welcome_locale.dart';

mixin AppLocale {
  static final Map<String, dynamic> en = {
    ...WelcomeLocale.EN,
    ...SettingsLocale.EN,
  };

  static final Map<String, dynamic> es = {
    ...WelcomeLocale.ES,
    ...SettingsLocale.ES,
  };
}
