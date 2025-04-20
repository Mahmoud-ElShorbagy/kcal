class Validators {
  static String? validateName(String? v) {
    if (v == null || v.isEmpty) {
      return 'Please enter your name';
    } else if (v.length < 2) {
      return "Should be at least 2 characters";
    } else if (v.length > 20) {
      return "Should be less than 20 characters";
    } else if (v.contains(" ")) {
      return "Should not contain spaces";
    }
    return null;
  }

  static String? validateEmail(String? v) {
    final validEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (v == null || v.isEmpty) {
      return 'Please enter your email';
    } else if (!validEmail.hasMatch(v)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? v) {
    if (v == null || v.isEmpty || v.length < 6) {
      return 'Please enter your password';
    }
    return null;
  }
}
