import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/common/widgets/primary_button.dart';
import 'package:resumebuilder/features/auth/screens/widgets/email_verify_icon.dart';
import 'package:resumebuilder/features/auth/screens/widgets/otp_input_row.dart';
import 'package:resumebuilder/features/auth/screens/widgets/resend_code_widget.dart';
import 'package:resumebuilder/routes/routes.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, this.email = 'alex.jordan@example.com'});

  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onVerify() {
    final otp = _controllers.map((c) => c.text).join();
    debugPrint('OTP entered: $otp');
    Get.offAllNamed(URoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // ── Back button (reused layout pattern)
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.maybePop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(6),
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
                ),

                // ── Email icon
                const SizedBox(height: 32),
                const EmailVerifyIcon(),

                // ── Title & subtitle
                const SizedBox(height: 32),
                const Text(
                  'Verify your email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF111318),
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 12),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      color: Color(0xFF616F89),
                      fontSize: 15,
                      height: 1.6,
                    ),
                    children: [
                      const TextSpan(
                        text: "We've sent a 6-digit code to your email\n",
                      ),
                      TextSpan(
                        text: widget.email,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF111318),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                // ── OTP boxes
                const SizedBox(height: 36),
                OtpInputRow(controllers: _controllers, focusNodes: _focusNodes),

                // ── Verify button
                const SizedBox(height: 32),
                PrimaryButton(label: 'Verify', onPressed: _onVerify),

                // ── Resend
                const SizedBox(height: 24),
                const ResendCodeWidget(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
