import 'package:get/get.dart';
import 'package:match_lagao/res/routes/routes_name.dart';
import 'package:match_lagao/splash_screen.dart';

import '../../view/login/login_screen.dart';
import '../../view/register/register_screen.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => LoginScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.registerScreen,
          page: () => RegisterScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ];
}
