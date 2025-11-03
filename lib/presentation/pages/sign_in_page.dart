import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:spend_flutter_app/core/constants/app_colors.dart';
import 'package:spend_flutter_app/core/localization/sign_locale.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            top: MediaQuery.of(context).viewInsets.top + 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                SignLocale.title.getString(context),
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                SignLocale.subtitle.getString(context),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.darkBorder,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SignLocale.labelEmail.getString(context),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(cursorColor: AppColors.primary),
                ],
              ),
              const SizedBox(height: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SignLocale.labelPassword.getString(context),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    cursorColor: AppColors.primary,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      suffixIconColor: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(SignLocale.buttonLogin.getString(context)),
                ),
              ),
              const SizedBox(height: 14),
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.normal,
                    ),
                    text: '${SignLocale.noAccount.getString(context)} ',
                    children: [
                      TextSpan(
                        text: SignLocale.createtAccount.getString(context),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
