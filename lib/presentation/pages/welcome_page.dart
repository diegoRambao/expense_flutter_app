import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spend_flutter_app/core/constants/app_colors.dart';

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
                'Bienvenido a wallat',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.surface,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Text(
                  'Una forma fácil de administrar tu dinero',
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
                    // TODO: navigate to login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surface,
                    foregroundColor: AppColors.primary,
                  ),
                  child: Text('Ingresar'),
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
