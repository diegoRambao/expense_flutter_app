import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:spend_flutter_app/src/core/di/injection_container.dart' as di;
import 'package:spend_flutter_app/src/core/localization/app_locale.dart';
import 'package:spend_flutter_app/src/core/theme/app_theme.dart';
import 'package:spend_flutter_app/src/features/auth/presentation/pages/welcome_page.dart';

final localization = FlutterLocalization.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();
  await localization.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();

    localization.init(
      mapLocales: [
        MapLocale('en', AppLocale.en),
        MapLocale('es', AppLocale.es),
      ],
      initLanguageCode: 'es', // idioma inicial
    );

    localization.onTranslatedLanguage = (locale) => setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallat',
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
    );
  }
}
