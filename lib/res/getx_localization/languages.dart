import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email': 'E-mail',
          'email_hint': 'Enter your email',
          'login': "Login",
          'password': "Password",
          'password_hint': 'Enter your password',
        }
      };
}
