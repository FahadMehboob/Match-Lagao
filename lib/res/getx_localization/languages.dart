import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email': 'E-mail',
          'email_hint': 'Enter your email',
          'email_error': 'Email is required',
          'invalid_email': 'Enter a valid email',
          'login': "Login",
          'sign_up': "Sign Up",
          'first_name': "First Name",
          'first_name_hint': "Enter first name",
          'first_name_error': "First name is required",
          'last_name': "Last Name",
          'last_name_hint': "Enter last name",
          'last_name_error': "Last name is required",
          'team_name': "Team Name",
          'team_name_hint': "Enter team name",
          'team_name_error': "Team name is required",
          'password': "Password",
          'password_hint': 'Enter your password',
          'password_error': 'Password is required',
          'invalid_password': 'Password must be at least 6 characters',
          'confirm_password': "Confirm Password",
          'confirm_password_hint': 'Enter confirm password',
          'confirm_password_error': 'Confirm password is required',
          'confirm_password_mismatch': 'Password not matched',
          'already_account': 'Already have an Account? ',
          'dont_have_account': "Don't have an account? ",
        }
      };
}
