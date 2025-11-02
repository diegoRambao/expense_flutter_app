// ignore_for_file: constant_identifier_names

mixin WelcomeLocale {
  static const String welcomeTitle = 'welcome_title';
  static const String welcomeSubtitle = 'welcome_subtitle';
  static const String loginButton = 'login_button';
  static const String signUpButton = 'sign_up_button';

  static const Map<String, dynamic> EN = {
    welcomeTitle: 'Welcome to Wallat',
    welcomeSubtitle: 'An easy way to manage your money',
    loginButton: 'Sign in',
    signUpButton: 'Sign up',
  };

  static const Map<String, dynamic> ES = {
    welcomeTitle: 'Bienvenido a Wallat',
    welcomeSubtitle: 'Una forma fácil de administrar tu dinero',
    loginButton: 'Ingresar',
    signUpButton: 'Registrarse',
  };
}
