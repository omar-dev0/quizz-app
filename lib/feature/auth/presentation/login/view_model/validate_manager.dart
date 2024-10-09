abstract class ValidateManger {

  static String? isEmailInputFieldEmpty(String? email) {
    if (email == null || email.isEmpty) {
      return "This Email is not valid";
    }
    return null;
  }

  static String? isPasswordInputFieldEmpty(String? password) {
    if (password == null || password.isEmpty) {
      return "This Password is not valid";
    }
    return null;
  }
}
