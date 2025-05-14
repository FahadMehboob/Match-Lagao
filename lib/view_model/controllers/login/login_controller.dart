import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final loading = false.obs;

  final obsecureText = true.obs;

  void obsecure() {
    obsecureText.value = !obsecureText.value;
  }
}
