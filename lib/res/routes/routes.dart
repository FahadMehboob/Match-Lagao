import 'package:get/get.dart';
import 'package:match_lagao/res/routes/routes_name.dart';

import '../../view/login/login_screen.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.loginScreen,
          page: () => LoginScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ];
}
