import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spend_flutter_app/src/core/di/injection_container.dart';
import 'package:spend_flutter_app/src/core/errors/exceptions.dart';
import 'package:spend_flutter_app/src/core/localization/auth/sign_up_locale.dart';
import 'package:spend_flutter_app/src/features/auth/domain/models/create_user_entity.dart';
import 'package:spend_flutter_app/src/features/auth/domain/usecases/create_user_usecase.dart';
import 'package:spend_flutter_app/src/features/auth/presentation/pages/email_verification_page.dart';

class SignUpViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool showPassword = false;

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  bool validatePasswords() {
    return passwordController.text == confirmPasswordController.text;
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void createUser(BuildContext context) async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final emailExistsError = SignUpLocale.labelEmailAlreadyExists.getString(
      context,
    );
    final successMessage = SignUpLocale.successFullSignUp.getString(context);

    final usecase = getIt<CreateUserUseCase>();

    final newUser = CreateUserEntity(
      email: emailController.text,
      emailVisibility: true,
      name: nameController.text,
      password: passwordController.text,
      passwordConfirm: confirmPasswordController.text,
    );

    try {
      await usecase.execute(newUser);
      Fluttertoast.showToast(
        msg: successMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14,
      );
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EmailVerificationPage(),
          ),
        );
      }
    } on UserAlreadyExistsException catch (_) {
      Fluttertoast.showToast(
        msg: emailExistsError,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error al crear el usuario",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
