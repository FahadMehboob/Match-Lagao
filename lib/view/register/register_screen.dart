import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_lagao/res/app_colors/app_colors.dart';
import 'package:match_lagao/res/fonts/app_fonts.dart';
import 'package:match_lagao/res/routes/routes_name.dart';
import 'package:match_lagao/utils/utils.dart';
import 'package:match_lagao/view_model/controllers/sign_up/sign_up_controller.dart';

import '../../components/round_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // Step 1: Form key
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());

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
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * .15),
                        Center(
                          child: Text(
                            "sign_up".tr,
                            style: AppFonts.gabaritoBold.copyWith(fontSize: 30),
                          ),
                        ),
                        SizedBox(height: Get.height * .05),

                        // --- First Name & Last Name ---
                        Row(
                          children: [
                            // First Name
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("first_name".tr,
                                      style: AppFonts.gabaritoRegular
                                          .copyWith(fontSize: 18)),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller:
                                        controller.firstNameController.value,
                                    focusNode:
                                        controller.firstNameFocusNode.value,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (value) {
                                      Utils.fieldFocusChange(
                                        context,
                                        controller.firstNameFocusNode.value,
                                        controller.lastNameFocusNode.value,
                                      );
                                    },
                                    decoration: InputDecoration(
                                      helperText: '',
                                      hintText: 'first_name_hint'.tr,
                                      hintStyle: AppFonts.gabaritoRegular
                                          .copyWith(
                                              fontSize: 16,
                                              color:
                                                  AppColors.inputFieldBorder),
                                      focusedErrorBorder: Utils.errorBorder,
                                      focusedBorder: Utils.focusedBorder,
                                      enabledBorder: Utils.enabledBorder,
                                      errorBorder: Utils.errorBorder,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'first_name_error'.tr;
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Last Name
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("last_name".tr,
                                      style: AppFonts.gabaritoRegular
                                          .copyWith(fontSize: 18)),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller:
                                        controller.lastNameController.value,
                                    focusNode:
                                        controller.lastNameFocusNode.value,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (value) {
                                      Utils.fieldFocusChange(
                                        context,
                                        controller.lastNameFocusNode.value,
                                        controller.teamNameFocusNode.value,
                                      );
                                    },
                                    decoration: InputDecoration(
                                      helperText: '',
                                      hintText: 'last_name_hint'.tr,
                                      hintStyle: AppFonts.gabaritoRegular
                                          .copyWith(
                                              fontSize: 16,
                                              color:
                                                  AppColors.inputFieldBorder),
                                      focusedErrorBorder: Utils.errorBorder,
                                      focusedBorder: Utils.focusedBorder,
                                      enabledBorder: Utils.enabledBorder,
                                      errorBorder: Utils.errorBorder,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'last_name_error'.tr;
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),

                        // --- Team Name ---
                        Text("team_name".tr,
                            style: AppFonts.gabaritoRegular
                                .copyWith(fontSize: 18)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: controller.teamNameController.value,
                          focusNode: controller.teamNameFocusNode.value,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(
                                context,
                                controller.teamNameFocusNode.value,
                                controller.emailFocusNode.value);
                          },
                          decoration: InputDecoration(
                            helperText: '',
                            hintText: 'team_name_hint'.tr,
                            hintStyle: AppFonts.gabaritoRegular.copyWith(
                                fontSize: 16,
                                color: AppColors.inputFieldBorder),
                            focusedErrorBorder: Utils.errorBorder,
                            focusedBorder: Utils.focusedBorder,
                            enabledBorder: Utils.enabledBorder,
                            errorBorder: Utils.errorBorder,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'team_name_error'.tr;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 3),

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
                            helperText: '',
                            hintText: 'email_hint'.tr,
                            hintStyle: AppFonts.gabaritoRegular.copyWith(
                                fontSize: 16,
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

                        const SizedBox(height: 3),

                        // --- Password ---
                        Text("password".tr,
                            style: AppFonts.gabaritoRegular
                                .copyWith(fontSize: 18)),
                        const SizedBox(height: 8),
                        Obx(
                          () => TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: controller.passwordController.value,
                            focusNode: controller.passwordFocusNode.value,
                            onFieldSubmitted: (value) {
                              Utils.fieldFocusChange(
                                  context,
                                  controller.passwordFocusNode.value,
                                  controller.confirmPasswordFocusNode.value);
                            },
                            obscureText: controller.obsecurePassword.value,
                            decoration: InputDecoration(
                              helperText: '',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.obsecurePass();
                                },
                                child: controller.obsecurePassword.value
                                    ? const Icon(Icons.visibility_off_outlined,
                                        color: AppColors.inputFieldBorder)
                                    : const Icon(Icons.visibility_outlined,
                                        color: AppColors.textColor),
                              ),
                              hintText: 'password_hint'.tr,
                              hintStyle: AppFonts.gabaritoRegular.copyWith(
                                  fontSize: 16,
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

                        // Confirm Password

                        const SizedBox(height: 3),

                        Text("confirm_password".tr,
                            style: AppFonts.gabaritoRegular
                                .copyWith(fontSize: 18)),
                        const SizedBox(height: 8),
                        Obx(
                          () => TextFormField(
                              textInputAction: TextInputAction.next,
                              controller:
                                  controller.confirmPasswordController.value,
                              focusNode:
                                  controller.confirmPasswordFocusNode.value,
                              onFieldSubmitted: (value) {
                                Utils.fieldFocusChange(
                                    context,
                                    controller.confirmPasswordFocusNode.value,
                                    controller.confirmPasswordFocusNode.value);
                              },
                              obscureText:
                                  controller.obsecureConfirmPassword.value,
                              decoration: InputDecoration(
                                helperText: '',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.obsecureConPass();
                                  },
                                  child: controller
                                          .obsecureConfirmPassword.value
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: AppColors.inputFieldBorder)
                                      : const Icon(Icons.visibility_outlined,
                                          color: AppColors.textColor),
                                ),
                                hintText: 'confirm_password_hint'.tr,
                                hintStyle: AppFonts.gabaritoRegular.copyWith(
                                    fontSize: 16,
                                    color: AppColors.inputFieldBorder),
                                focusedErrorBorder: Utils.errorBorder,
                                focusedBorder: Utils.focusedBorder,
                                enabledBorder: Utils.enabledBorder,
                                errorBorder: Utils.errorBorder,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'confirm_password_error'.tr;
                                } else if (value !=
                                    controller.passwordController.value.text) {
                                  return 'confirm_password_mismatch'.tr;
                                }
                                return null;
                              }),
                        ),

                        const SizedBox(height: 20),

                        // --- Submit Button ---
                        RoundButton(
                          title: 'sign_up'.tr,
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
                      text: "already_account".tr,
                      style: AppFonts.gabaritoRegular.copyWith(
                        color: AppColors.textColor,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'login'.tr,
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
