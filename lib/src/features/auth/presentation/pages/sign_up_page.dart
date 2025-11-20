import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:spend_flutter_app/src/core/constants/app_colors.dart';
import 'package:spend_flutter_app/src/core/localization/auth/sign_up_locale.dart';
import 'package:spend_flutter_app/src/core/utils/validators.dart';
import 'package:spend_flutter_app/src/features/auth/presentation/components/labeled_text_field.dart';
import 'package:spend_flutter_app/src/features/auth/presentation/providers/sign_up_view_model.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignUpViewModel(),
      child: _SignUpPageView(),
    );
  }
}

class _SignUpPageView extends StatelessWidget {
  static const double spaceBetweenFields = 16;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = context.watch<SignUpViewModel>();

    return ChangeNotifierProvider(
      create: (BuildContext context) => SignUpViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              top: MediaQuery.of(context).viewInsets.top + 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                Text(
                  SignUpLocale.title.getString(context),
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  SignUpLocale.subtitle.getString(context),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.darkBorder,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Form(
                  key: viewModel.formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // Name Field
                      LabeledTextField(
                        label: SignUpLocale.labelName.getString(context),
                        controller: viewModel.nameController,
                        validator: (value) =>
                            AppValidators.requiredField(value, context),
                      ),
                      const SizedBox(height: spaceBetweenFields),
                      // Email Field
                      LabeledTextField(
                        label: SignUpLocale.labelEmail.getString(context),
                        controller: viewModel.emailController,
                        validator: (value) =>
                            AppValidators.email(value, context),
                      ),
                      const SizedBox(height: spaceBetweenFields),
                      // Password Field
                      LabeledTextField(
                        label: SignUpLocale.labelPassword.getString(context),
                        controller: viewModel.passwordController,
                        validator: (value) =>
                            AppValidators.password(value, context),
                        obscureText: !viewModel.showPassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => viewModel.togglePasswordVisibility(),
                        ),
                      ),
                      const SizedBox(height: spaceBetweenFields),
                      // PasswordConfirm Field
                      LabeledTextField(
                        label: SignUpLocale.labelPasswordConfirmation.getString(
                          context,
                        ),
                        controller: viewModel.confirmPasswordController,
                        obscureText: !viewModel.showPassword,
                        validator: (value) {
                          if (value != viewModel.passwordController.text) {
                            return SignUpLocale.errorPasswordMismatch.getString(
                              context,
                            );
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => viewModel.togglePasswordVisibility(),
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => viewModel.createUser(context),
                          child: Text(
                            SignUpLocale.buttonSignUp.getString(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: RichText(
                          text: TextSpan(
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.normal,
                            ),
                            text:
                                '${SignUpLocale.yesAccount.getString(context)} ',
                            children: [
                              TextSpan(
                                text: SignUpLocale.login.getString(context),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
