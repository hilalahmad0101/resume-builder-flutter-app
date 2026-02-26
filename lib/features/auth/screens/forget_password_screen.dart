import 'package:flutter/material.dart';
import 'package:resumebuilder/common/widgets/app_text_field.dart';
import 'package:resumebuilder/common/widgets/primary_button.dart';
import 'package:resumebuilder/features/auth/screens/widgets/remember_password_footer.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendResetLink() {
    debugPrint('Reset link sent to: ${_emailController.text}');
    // TODO: call backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
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
                      // ── Back button — REUSED layout
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => Navigator.maybePop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color(0xFF111318),
                            size: 18,
                          ),
                        ),
                      ),

                      // ── Header — REUSED AppHeading / AppSubtitle style
                      const SizedBox(height: 28),
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Color(0xFF111318),
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Enter your email address to reset your password. We'll send a link to your inbox.",
                        style: TextStyle(
                          color: Color(0xFF616F89),
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),

                      // ── Email field — REUSED AppTextField
                      const SizedBox(height: 32),
                      AppTextField(
                        label: 'Email Address',
                        hint: 'name@example.com',
                        prefixIcon: Icons.mail_outline_rounded,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),

                      // ── CTA — REUSED PrimaryButton
                      const SizedBox(height: 24),
                      PrimaryButton(
                        label: 'Send Reset Link',
                        onPressed: _onSendResetLink,
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),

            // ── Footer — NEW RememberPasswordFooter
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: RememberPasswordFooter(
                onSignIn: () => Navigator.maybePop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
