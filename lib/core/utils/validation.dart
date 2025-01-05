class FormValidator {
  static String? validateEmptyField(String? str) {
    if (str == null || str.trim().isEmpty) {
      return "Field cannot be empty";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? str) {
    final isEmpty = validateEmptyField(str);
    if (isEmpty != null) {
      return isEmpty;
    } else {
      if (!(RegExp(
              r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
          .hasMatch(str!.trim()))) {
        return 'Invalid email';
      }
    }
    return null;
  }

  static String? validatePhoneNumber(String? str) {
    final emptyField = validateEmptyField(str);
    if (emptyField != null) {
      return emptyField;
    }

    if (str!.trim().length != 11) {
      return "Invalid phone number";
    }

    return null;
  }
}
