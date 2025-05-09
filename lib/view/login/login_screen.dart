import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_lagao/res/app_colors/app_colors.dart';
import 'package:match_lagao/res/fonts/app_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Step 1: Form key
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey, // Step 2: Assign key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * .15),
                Center(
                  child: Text(
                    "login".tr,
                    style: AppFonts.gabaritoBold.copyWith(fontSize: 30),
                  ),
                ),
                SizedBox(height: Get.height * .05),

                // Email
                Text(
                  "email".tr,
                  style: AppFonts.gabaritoRegular.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'email_hint'.tr,
                    hintStyle: AppFonts.gabaritoRegular.copyWith(
                        fontSize: 18, color: AppColors.inputFieldBorder),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.errorColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.inputFieldBorder),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.errorColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Password
                Text(
                  "password".tr,
                  style: AppFonts.gabaritoRegular.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 40),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Step 3: Validate on submit
                      if (_formKey.currentState!.validate()) {
                        // Success
                        Get.snackbar("Success", "Form is valid");
                      }
                    },
                    child: Text(
                      "Login",
                      style: AppFonts.gabaritoBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
