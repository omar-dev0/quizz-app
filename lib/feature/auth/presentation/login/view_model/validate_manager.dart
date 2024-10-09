import 'controller_manger.dart';

abstract class ValidateManger {
  static String? isEmailInputFieldEmpty(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    return null;
  }

  static String? isPasswordInputFieldEmpty(String? password) {
    if (password == null || password.isEmpty) {
      return "password is required";
    }
    return null;
  }
}
