import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_lagao/res/app_colors/app_colors.dart';
import 'package:match_lagao/res/fonts/app_fonts.dart';
import 'package:match_lagao/res/routes/routes_name.dart';
import 'package:match_lagao/utils/utils.dart';
import 'package:match_lagao/view_model/controllers/login/login_controller.dart';

import '../../components/round_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // Step 1: Form key
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ---------- Top Form Section ----------
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * .15),
                        Center(
                          child: Text(
                            "register".tr,
                            style: AppFonts.gabaritoBold.copyWith(fontSize: 30),
                          ),
                        ),
                        SizedBox(height: Get.height * .05),

                        // --- Email ---
                        Text("email".tr,
                            style: AppFonts.gabaritoRegular
                                .copyWith(fontSize: 18)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: controller.emailController.value,
                          focusNode: controller.emailFocusNode.value,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(
                                context,
                                controller.emailFocusNode.value,
                                controller.passwordFocusNode.value);
                          },
                          decoration: InputDecoration(
                            hintText: 'email_hint'.tr,
                            hintStyle: AppFonts.gabaritoRegular.copyWith(
                                fontSize: 18,
                                color: AppColors.inputFieldBorder),
                            focusedErrorBorder: Utils.errorBorder,
                            focusedBorder: Utils.focusedBorder,
                            enabledBorder: Utils.enabledBorder,
                            errorBorder: Utils.errorBorder,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'email_error'.tr;
                            } else if (!value.contains('@')) {
                              return 'invalid_email'.tr;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // --- Password ---
                        Text("password".tr,
                            style: AppFonts.gabaritoRegular
                                .copyWith(fontSize: 18)),
                        const SizedBox(height: 8),
                        Obx(
                          () => TextFormField(
                            controller: controller.passwordController.value,
                            focusNode: controller.passwordFocusNode.value,
                            onFieldSubmitted: (value) {
                              Utils.fieldFocusChange(
                                  context,
                                  controller.passwordFocusNode.value,
                                  controller.passwordFocusNode.value);
                            },
                            obscureText: controller.obsecureText.value,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.obsecure();
                                },
                                child: controller.obsecureText.value
                                    ? const Icon(Icons.visibility_off_outlined,
                                        color: AppColors.inputFieldBorder)
                                    : const Icon(Icons.visibility_outlined,
                                        color: AppColors.textColor),
                              ),
                              hintText: 'password_hint'.tr,
                              hintStyle: AppFonts.gabaritoRegular.copyWith(
                                  fontSize: 18,
                                  color: AppColors.inputFieldBorder),
                              focusedErrorBorder: Utils.errorBorder,
                              focusedBorder: Utils.focusedBorder,
                              enabledBorder: Utils.enabledBorder,
                              errorBorder: Utils.errorBorder,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'password_error'.tr;
                              } else if (value.length < 6) {
                                return 'invalid_password'.tr;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: AppFonts.gabaritoRegular.copyWith(
                                color: AppColors.accentColor,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.accentColor,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // --- Submit Button ---
                        RoundButton(
                          title: 'login'.tr,
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              Utils.snackBar('Success', 'Form Submitted');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ---------- Bottom Signup Prompt ----------
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: AppFonts.gabaritoRegular.copyWith(
                        color: AppColors.textColor,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: AppFonts.gabaritoRegular.copyWith(
                            color: AppColors.accentColor,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RoutesName.loginScreen);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
