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
  static const String labelPasswordConfirmation =
      'sign_up_label_password_confirmation';

  // Errors Labels
  static const String errorEmptyField = 'sign_up_error_empty_field';
  static const String errorInvalidEmail = 'sign_up_error_invalid_email';
  static const String errorPasswordMismatch = 'sign_up_error_password_mismatch';
  static const String errorWeakPassword = 'sign_up_error_weak_password';

  static const Map<String, dynamic> EN = {
    title: 'Sign Up',
    subtitle: 'Create an account and start managing your finances',
    labelName: 'Name',
    labelEmail: 'Email',
    labelPassword: 'Password',
    labelPasswordConfirmation: 'Confirm Password',
    buttonSignUp: 'Sign Up',
    yesAccount: 'Do you already have an account?',
    login: 'Login In',

    // Errors
    errorEmptyField: 'This field cannot be empty',
    errorInvalidEmail: 'Please enter a valid email address',
    errorPasswordMismatch: 'Passwords do not match',
    errorWeakPassword: 'Password must have at least 8 characters',
  };

  static const Map<String, dynamic> ES = {
    title: 'Crear cuenta',
    subtitle: 'Crea una cuenta y comienza a gestionar tus finanzas',
    labelName: 'Nombre',
    labelEmail: 'Email',
    labelPassword: 'Contraseña',
    labelPasswordConfirmation: 'Confirmar Contraseña',
    buttonSignUp: 'Crear cuenta',
    yesAccount: '¿Ya tienes una cuenta?',
    login: 'Inicia Sesión',

    // Errors
    errorEmptyField: 'Este campo no puede estar vacío',
    errorInvalidEmail: 'Por favor ingresa un correo válido',
    errorPasswordMismatch: 'Las contraseñas no coinciden',
    errorWeakPassword: 'La contraseña debe tener al menos 8 caracteres',
  };
}
