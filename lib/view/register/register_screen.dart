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

  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 32),

                    Expanded(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "sign_up".tr,
                                style: AppFonts.gabaritoBold
                                    .copyWith(fontSize: 30),
                              ),
                            ),
                            const SizedBox(height: 32),

                            // First Name & Last Name
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("first_name".tr,
                                          style: AppFonts.gabaritoRegular
                                              .copyWith(fontSize: 18)),
                                      const SizedBox(height: 8),
                                      _buildTextField(
                                        controller.firstNameController.value,
                                        controller.firstNameFocusNode.value,
                                        'first_name_hint'.tr,
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'first_name_error'.tr
                                                : null,
                                        nextFocusNode:
                                            controller.lastNameFocusNode.value,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("last_name".tr,
                                          style: AppFonts.gabaritoRegular
                                              .copyWith(fontSize: 18)),
                                      const SizedBox(height: 8),
                                      _buildTextField(
                                        controller.lastNameController.value,
                                        controller.lastNameFocusNode.value,
                                        'last_name_hint'.tr,
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'last_name_error'.tr
                                                : null,
                                        nextFocusNode:
                                            controller.teamNameFocusNode.value,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Team Name
                            Text("team_name".tr,
                                style: AppFonts.gabaritoRegular
                                    .copyWith(fontSize: 18)),
                            const SizedBox(height: 8),
                            _buildTextField(
                              controller.teamNameController.value,
                              controller.teamNameFocusNode.value,
                              'team_name_hint'.tr,
                              (value) => value == null || value.isEmpty
                                  ? 'team_name_error'.tr
                                  : null,
                              nextFocusNode: controller.emailFocusNode.value,
                            ),

                            const SizedBox(height: 16),

                            // Email
                            Text("email".tr,
                                style: AppFonts.gabaritoRegular
                                    .copyWith(fontSize: 18)),
                            const SizedBox(height: 8),
                            _buildTextField(
                              controller.emailController.value,
                              controller.emailFocusNode.value,
                              'email_hint'.tr,
                              (value) {
                                if (value == null || value.isEmpty) {
                                  return 'email_error'.tr;
                                } else if (!value.contains('@')) {
                                  return 'invalid_email'.tr;
                                }
                                return null;
                              },
                              nextFocusNode: controller.passwordFocusNode.value,
                            ),

                            const SizedBox(height: 16),

                            // Password
                            Text("password".tr,
                                style: AppFonts.gabaritoRegular
                                    .copyWith(fontSize: 18)),
                            const SizedBox(height: 8),
                            Obx(
                              () => TextFormField(
                                controller: controller.passwordController.value,
                                focusNode: controller.passwordFocusNode.value,
                                obscureText: controller.obsecurePassword.value,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  Utils.fieldFocusChange(
                                      context,
                                      controller.passwordFocusNode.value,
                                      controller
                                          .confirmPasswordFocusNode.value);
                                },
                                decoration: InputDecoration(
                                  hintText: 'password_hint'.tr,
                                  hintStyle: AppFonts.gabaritoRegular.copyWith(
                                      fontSize: 16,
                                      color: AppColors.inputFieldBorder),
                                  helperText: '',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.obsecurePass();
                                    },
                                    child: Icon(
                                      controller.obsecurePassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: AppColors.inputFieldBorder,
                                    ),
                                  ),
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

                            const SizedBox(height: 16),

                            // Confirm Password
                            Text("confirm_password".tr,
                                style: AppFonts.gabaritoRegular
                                    .copyWith(fontSize: 18)),
                            const SizedBox(height: 8),
                            Obx(
                              () => TextFormField(
                                controller:
                                    controller.confirmPasswordController.value,
                                focusNode:
                                    controller.confirmPasswordFocusNode.value,
                                obscureText:
                                    controller.obsecureConfirmPassword.value,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: 'confirm_password_hint'.tr,
                                  hintStyle: AppFonts.gabaritoRegular.copyWith(
                                      fontSize: 16,
                                      color: AppColors.inputFieldBorder),
                                  helperText: '',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.obsecureConPass();
                                    },
                                    child: Icon(
                                      controller.obsecureConfirmPassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: AppColors.inputFieldBorder,
                                    ),
                                  ),
                                  focusedErrorBorder: Utils.errorBorder,
                                  focusedBorder: Utils.focusedBorder,
                                  enabledBorder: Utils.enabledBorder,
                                  errorBorder: Utils.errorBorder,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'confirm_password_error'.tr;
                                  } else if (value !=
                                      controller
                                          .passwordController.value.text) {
                                    return 'confirm_password_mismatch'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ),

                            const SizedBox(height: 24),

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

                    // Bottom Text
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
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
        }),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    FocusNode focusNode,
    String hint,
    String? Function(String?) validator, {
    FocusNode? nextFocusNode,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction:
          nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          Utils.fieldFocusChange(
            Get.context!,
            focusNode,
            nextFocusNode,
          );
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        helperText: '',
        hintStyle: AppFonts.gabaritoRegular.copyWith(
          fontSize: 16,
          color: AppColors.inputFieldBorder,
        ),
        focusedErrorBorder: Utils.errorBorder,
        focusedBorder: Utils.focusedBorder,
        enabledBorder: Utils.enabledBorder,
        errorBorder: Utils.errorBorder,
      ),
      validator: validator,
    );
  }
}
