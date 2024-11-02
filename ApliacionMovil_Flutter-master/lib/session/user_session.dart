class UserSession {
  static String _email = '';
  static String id = '';

  //static String _role = '';

  static String get email => _email;

  static void setEmail(String email) {
    _email = email;
  }

  static String get userId => id;

  static void setUserId(String userId) {
    id = userId;
  }

  /*
  static String get role => _role;

  static void setRole(String role) {
    _role = role;
  }
  */
}