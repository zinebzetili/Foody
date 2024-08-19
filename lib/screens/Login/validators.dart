class Validator {
   static String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field should not be empty';
  }
  final RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!emailRegExp.hasMatch(value)) {
    return 'Invalid email address';
  }
  return null;  
}

  static String? validatePassword(String? value) {
  if (value == null || value.isEmpty || value.length < 8) {
    return 'Password must be at least 8 characters';
  }
  if (!RegExp(r'\d').hasMatch(value)) {
    return 'Password must contain at least one number';
  }
  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Password must contain at least one special character';
  }
  return null;  
}
}