// ignore_for_file: constant_identifier_names

mixin SignUpLocale {
  static const String title = 'sign_up_title';
  static const String subtitle = 'sign_up_subtitle';
  static const String labelName = 'sign_up_label_name';
  static const String labelEmail = 'sign_up_label_email';
  static const String labelPassword = 'sign_up_label_password';
  static const String buttonSignUp = 'sign_up_button_sign_up';
  static const String yesAccount = 'sign_up_yes_account';
  static const String login = 'sign_up_login';

  static const Map<String, dynamic> EN = {
    title: 'Sign Up',
    subtitle: 'Create an account and start managing your finances',
    labelName: 'Name',
    labelEmail: 'Email',
    labelPassword: 'Password',
    buttonSignUp: 'Sign Up',
    yesAccount: 'Do you already have an account?',
    login: 'Login In',
  };

  static const Map<String, dynamic> ES = {
    title: 'Crear cuenta',
    subtitle: 'Crea una cuenta y comienza a gestionar tus finanzas',
    labelName: 'Nombre',
    labelEmail: 'Email',
    labelPassword: 'Contraseña',
    buttonSignUp: 'Crear cuenta',
    yesAccount: '¿Ya tienes una cuenta?',
    login: 'Inicia Sesión',
  };
}
