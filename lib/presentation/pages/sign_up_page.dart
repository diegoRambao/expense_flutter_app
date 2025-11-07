import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:spend_flutter_app/core/constants/app_colors.dart';
import 'package:spend_flutter_app/core/localization/sign_up_locale.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = false;
  static const spaceBetweenFields = 16.0;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void disposeControllers() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void handleSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
  }

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
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          SignUpLocale.labelName.getString(context),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: AppColors.primary,
                          controller: _nameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value!.isEmpty
                              ? SignUpLocale.errorEmptyField.getString(context)
                              : null,
                        ),
                      ],
                    ),
                    const SizedBox(height: spaceBetweenFields),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          SignUpLocale.labelEmail.getString(context),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: AppColors.primary,
                          controller: _emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return SignUpLocale.errorEmptyField.getString(
                                context,
                              );
                            }
                            if (!value.contains('@')) {
                              return SignUpLocale.errorInvalidEmail.getString(
                                context,
                              );
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: spaceBetweenFields),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          SignUpLocale.labelPassword.getString(context),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: AppColors.primary,
                          obscureText: !showPassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return SignUpLocale.errorEmptyField.getString(
                                context,
                              );
                            }
                            if (value.length < 8) {
                              return SignUpLocale.errorWeakPassword.getString(
                                context,
                              );
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                showPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () =>
                                  setState(() => showPassword = !showPassword),
                            ),
                            suffixIconColor: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: spaceBetweenFields),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          SignUpLocale.labelPasswordConfirmation.getString(
                            context,
                          ),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _confirmPasswordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.primary,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return SignUpLocale.errorEmptyField.getString(
                                context,
                              );
                            }
                            if (value != _passwordController.text) {
                              return SignUpLocale.errorPasswordMismatch
                                  .getString(context);
                            }
                            return null;
                          },
                          obscureText: !showPassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                showPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () =>
                                  setState(() => showPassword = !showPassword),
                            ),
                            suffixIconColor: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => handleSubmit(),
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
    );
  }
}
