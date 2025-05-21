import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController().obs;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final teamNameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;
  final teamNameFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;

  final loading = false.obs;

  final obsecurePassword = true.obs;
  final obsecureConfirmPassword = true.obs;

  void obsecurePass() {
    obsecurePassword.value = !obsecurePassword.value;
  }

  void obsecureConPass() {
    obsecureConfirmPassword.value = !obsecureConfirmPassword.value;
  }
}
