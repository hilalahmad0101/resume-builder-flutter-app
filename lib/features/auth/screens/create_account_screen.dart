import 'package:flutter/material.dart';
import 'package:resumebuilder/common/widgets/app_heading.dart';
import 'package:resumebuilder/common/widgets/app_sub_title.dart';
import 'package:resumebuilder/common/widgets/app_text_field.dart';
import 'package:resumebuilder/common/widgets/or_divider.dart';
import 'package:resumebuilder/common/widgets/primary_button.dart';
import 'package:resumebuilder/common/widgets/social_button.dart';
import 'package:resumebuilder/common/widgets/term_text.dart';
import 'package:resumebuilder/features/auth/screens/widgets/sign_in_footer.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _obscurePassword = true;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Back button
                const SizedBox(height: 16),
                BackButton(),

                // ── Header
                const SizedBox(height: 24),
                const AppHeading(text: 'Create Account'),
                const SizedBox(height: 8),
                const AppSubtitle(
                  text:
                      'Join us and build your professional resume in minutes.',
                ),

                // ── Form fields
                const SizedBox(height: 32),
                AppTextField(
                  label: 'Full Name',
                  hint: 'John Doe',
                  prefixIcon: Icons.person_outline_rounded,
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  label: 'Email Address',
                  hint: 'name@example.com',
                  prefixIcon: Icons.mail_outline_rounded,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  label: 'Password',
                  hint: '••••••••',
                  prefixIcon: Icons.lock_outline_rounded,
                  obscureText: _obscurePassword,
                  controller: _passwordController,
                  suffix: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: const Color(0xFF616F89),
                      size: 20,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),

                // ── CTA
                const SizedBox(height: 28),
                PrimaryButton(
                  label: 'Create Account',
                  onPressed: () {
                    // TODO: handle registration
                  },
                ),

                // ── Social sign-in
                const SizedBox(height: 28),
                const OrDivider(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SocialButton(
                      imageNetwork:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuAwUZB0oBj6mwKfQgk9WneLKOeyFzcphKTQ7pCe969crk54xkqo9_1QxXLktgvrdkyBFI3OI9bJY8uqvXqKKJG6AXq7wlekJ38XnIj1WIFzpi-nIwerENYH7R5_lS3LGPpv2H84AOK5oSe86Obowhexvsj3rObSjd_NxS6jC0l8DZsR0S0BOJiv6Ass9F5sGAYS-IIgkVSe-8acbMc4SXpTz0C3I-UnNnMGHCo_RLH9mN1MLr0mGvyEy24timquybAjTrlVIcuf6e4u',
                    ),
                    const SizedBox(width: 16),
                    const SocialButton(iconData: Icons.apple_rounded),
                  ],
                ),

                // ── Footer
                const SizedBox(height: 36),
                const SignInFooter(),
                const SizedBox(height: 16),
                const Center(child: TermsText()),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
