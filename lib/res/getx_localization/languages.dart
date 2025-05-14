import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email': 'E-mail',
          'email_hint': 'Enter your email',
          'email_error': 'Please enter your email',
          'invalid_email': 'Enter a valid email',
          'login': "Login",
          'password': "Password",
          'password_hint': 'Enter your password',
          'password_error': 'Please enter your password',
          'invalid_password': 'Password must be at least 6 characters',
        }
      };
}
