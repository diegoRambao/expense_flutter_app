// ignore_for_file: constant_identifier_names

mixin SignLocale {
  static const String title = 'sign_title';
  static const String subtitle = 'sign_subtitle';
  static const String labelEmail = 'sign_label_email';
  static const String labelPassword = 'sign_label_password';
  static const String buttonLogin = 'sign_button_login';
  static const String noAccount = 'sign_no_account';
  static const String createtAccount = 'sign_create_account';

  static const Map<String, dynamic> EN = {
    title: 'Sign in',
    subtitle: '',
    labelEmail: '',
    labelPassword: '',
    buttonLogin: '',
    noAccount: '',
    createtAccount: '',
  };

  static const Map<String, dynamic> ES = {
    title: 'Iniciar sesion',
    subtitle: '¡Hola de nuevo! Ingresa tus credenciales para iniciar sesion',
    labelEmail: 'Email',
    labelPassword: 'Contraseña',
    buttonLogin: 'Iniciar sesión',
    noAccount: '¿No tienes una cuenta?',
    createtAccount: 'Crear cuenta',
  };
}
