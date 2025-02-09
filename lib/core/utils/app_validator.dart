class AppValidator {
  AppValidator._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null) {
      return 'This field is required.';
    } else if (val.trim().isEmpty) {
      return 'This field is required.';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'Please enter valid email.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    if (val == null) {
      return 'This field is required.';
    } else if (val.isEmpty) {
      return 'This field is required.';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'Please enter strong Password.';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'This field is required.';
    } else if (val != password) {
      return 'same password';
    } else {
      return null;
    }
  }

  static String? validateUserName(String? val) {
    RegExp userNameRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    if (val == null) {
      return 'This field is required.';
    } else if (val.isEmpty) {
      return 'This field is required.';
    } else if (!userNameRegex.hasMatch(val)) {
      return 'Please enter valid Username';
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return 'This field is required.';
    } else if (int.tryParse(val.trim()) == null) {
      return 'Enter numbers only';
    } else if (val.trim().length != 11) {
      return 'Enter value must equal 11 digit';
    } else {
      return null;
    }
  }
}
