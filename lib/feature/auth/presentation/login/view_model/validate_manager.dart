import 'package:quizz_app/core/local/local.dart';

abstract class ValidateManger {

  static String? isEmailInputFieldEmpty(String? email) {
    if (email == null || email.isEmpty) {
      return AppStrings.notValidEmail;
    }
    return null;
  }

  static String? isPasswordInputFieldEmpty(String? password) {
    if (password == null || password.isEmpty) {
      return AppStrings.notValidPassword;
    }
    return null;
  }
}
