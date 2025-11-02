import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:spend_flutter_app/core/constants/app_colors.dart';
import 'package:spend_flutter_app/core/localization/welcome_locale.dart';
import 'package:spend_flutter_app/presentation/providers/welcome_provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeProvider(),
      child: const _WelcomeView(),
    );
  }
}

class _WelcomeView extends StatelessWidget {
  static const String _assetName = 'assets/welcome.svg';

  const _WelcomeView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final welcomeProvider = context.watch<WelcomeProvider>();

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: SvgPicture.asset(_assetName)),
              Text(
                WelcomeLocale.welcomeTitle.getString(context),
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.surface,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Text(
                  WelcomeLocale.welcomeSubtitle.getString(context),
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: AppColors.surface,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    welcomeProvider.toggleSignUp();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surface,
                    foregroundColor: AppColors.primary,
                  ),
                  child: Text(WelcomeLocale.loginButton.getString(context)),
                ),
              ),
              Text(welcomeProvider.showSignUp.toString()),
              if (welcomeProvider.showSignUp) ...[
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(WelcomeLocale.signUpButton.getString(context)),
                  ),
                ),
              ],
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
