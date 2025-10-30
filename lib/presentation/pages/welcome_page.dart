import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spend_flutter_app/core/constants/app_colors.dart';
import 'package:spend_flutter_app/core/localization/app_locale.dart';
import 'package:spend_flutter_app/core/localization/welcome_locale.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const String assetName = 'assets/welcome.svg';

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: SvgPicture.asset(assetName)),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surface,
                    foregroundColor: AppColors.primary,
                  ),
                  child: Text(WelcomeLocale.loginButton.getString(context)),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
