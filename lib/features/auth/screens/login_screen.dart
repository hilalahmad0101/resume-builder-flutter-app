import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/common/widgets/app_heading.dart';
import 'package:resumebuilder/common/widgets/app_sub_title.dart';
import 'package:resumebuilder/common/widgets/app_text_field.dart';
import 'package:resumebuilder/common/widgets/or_divider.dart';
import 'package:resumebuilder/common/widgets/primary_button.dart';
import 'package:resumebuilder/common/widgets/social_button.dart';
import 'package:resumebuilder/routes/routes.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundLightColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const AppHeading(text: 'Welcome Back!'),
                const SizedBox(height: 8),
                const AppSubtitle(
                  text:
                      'Login to your account to continue building your resume.',
                ),
                const SizedBox(height: 40),

                // Email Field
                AppTextField(
                  label: 'Email Address',
                  hint: 'name@example.com',
                  prefixIcon: Icons.mail_outline_rounded,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),

                // Password Field
                AppTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  prefixIcon: Icons.lock_outline_rounded,
                  obscureText: _obscurePassword,
                  controller: _passwordController,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                      color: const Color(0xFF616F89),
                    ),
                  ),
                ),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Get.toNamed(URoutes.forgotPassword),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: UColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Login Button
                PrimaryButton(
                  label: 'Login',
                  onPressed: () => Get.offAllNamed(URoutes.home),
                ),
                const SizedBox(height: 24),

                const OrDivider(),
                const SizedBox(height: 24),

                // Social Buttons
                Row(
                  children: [
                    Expanded(
                      child: SocialButton(
                        imageNetwork:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuAwUZB0oBj6mwKfQgk9WneLKOeyFzcphKTQ7pCe969crk54xkqo9_1QxXLktgvrdkyBFI3OI9bJY8uqvXqKKJG6AXq7wlekJ38XnIj1WIFzpi-nIwerENYH7R5_lS3LGPpv2H84AOK5oSe86Obowhexvsj3rObSjd_NxS6jC0l8DZsR0S0BOJiv6Ass9F5sGAYS-IIgkVSe-8acbMc4SXpTz0C3I-UnNnMGHCo_RLH9mN1MLr0mGvyEy24timquybAjTrlVIcuf6e4u',
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: SocialButton(iconData: Icons.apple_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: UColors.grayColor),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(URoutes.createAccount),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: UColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
