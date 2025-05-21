import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_lagao/res/app_colors/app_colors.dart';
import 'package:match_lagao/res/getx_localization/languages.dart';
import 'package:match_lagao/res/routes/routes.dart';
import 'package:match_lagao/view/register/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      debugShowCheckedModeBanner: false,
      title: 'Match Lagao',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: RegisterScreen(),
      getPages: Routes.appRoutes(),
    );
  }
}
