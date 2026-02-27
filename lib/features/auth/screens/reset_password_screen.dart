import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/common/widgets/app_heading.dart';
import 'package:resumebuilder/common/widgets/app_sub_title.dart';
import 'package:resumebuilder/common/widgets/app_text_field.dart';
import 'package:resumebuilder/common/widgets/primary_button.dart';
import 'package:resumebuilder/routes/routes.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool _hasEightChars = false;
  bool _hasSpecialAndNum = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    final password = _passwordController.text;
    setState(() {
      _hasEightChars = password.length >= 8;
      _hasSpecialAndNum =
          password.contains(RegExp(r'[0-9]')) &&
          password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  @override
  void dispose() {
    _passwordController.removeListener(_validatePassword);
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundLightColor,
      appBar: AppBar(
        backgroundColor: UColors.backgroundLightColor.withValues(alpha: 0.8),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: IconButton(
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: const CircleBorder(),
              ),
              color: UColors.blackColor,
            ),
          ),
        ),
        title: const Text(
          'Reset Password',
          style: TextStyle(
            color: UColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      const AppHeading(text: 'Create new password'),
                      const SizedBox(height: 8),
                      const AppSubtitle(
                        text:
                            'Your new password must be different from previous used passwords.',
                      ),
                      const SizedBox(height: 32),

                      // New Password Field
                      AppTextField(
                        label: 'New Password',
                        hint: 'Enter your new password',
                        prefixIcon: Icons.lock_outline_rounded,
                        obscureText: !_isPasswordVisible,
                        controller: _passwordController,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            color: const Color(0xFF616F89),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Confirm Password Field
                      AppTextField(
                        label: 'Confirm New Password',
                        hint: 'Repeat your new password',
                        prefixIcon: Icons.lock_outline_rounded,
                        obscureText: !_isConfirmPasswordVisible,
                        controller: _confirmPasswordController,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            color: const Color(0xFF616F89),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Validation List
                      _ValidationItem(
                        text: 'At least 8 characters',
                        isValid: _hasEightChars,
                      ),
                      const SizedBox(height: 8),
                      _ValidationItem(
                        text: 'One special character & one number',
                        isValid: _hasSpecialAndNum,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(
                    label: 'Update Password',
                    onPressed: () => Get.offAllNamed(URoutes.login),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Having trouble? ',
                        style: TextStyle(
                          color: UColors.grayColor,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Contact Support',
                          style: TextStyle(
                            color: UColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ValidationItem extends StatelessWidget {
  final String text;
  final bool isValid;

  const _ValidationItem({required this.text, required this.isValid});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid
              ? Icons.check_circle_rounded
              : Icons.radio_button_unchecked_outlined,
          size: 16,
          color: isValid ? Colors.green : UColors.grayColor,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green : UColors.grayColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
