import 'package:flutter/material.dart';
import 'package:resumebuilder/utils/constants/colors.dart';
import 'package:resumebuilder/utils/constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ShaderMask(
              shaderCallback: (shader) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [UColors.blackColor, Colors.transparent],
                  stops: [0.3, 1.0],
                ).createShader(
                  Rect.fromLTRB(0, 0, shader.width, shader.height),
                );
              },
              blendMode: BlendMode.dstIn,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAhM0snzXmgJk7k-zyHbZUl1l1gFKbvT5TlXozWPltT7Py6HSzaSXRC3DVcQ04jIRC5YKtLobRjzE8gAMBxzTzib8IH5z6JRhlT7wndihEL4bxzY7dNEPPSbOCUKl-GBekPVtG1ZhoFE-8015Dr73ShZehrTuknflaIjBUaqwzgghxmZ02NOgSgr-E5b2QalLKM5cVdaUQes4tiucu3_9QOgzuc20-88Vi6TIaqF5WgSvSycclfbiQ5QciKx1hIq8I2GU2ehz6qHYsQ',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  const Text(
                    ' Build Your Career with Confidence',
                    style: TextStyle(
                      color: UColors.textLightColor,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your dream job starts with a professional resume. Simple, fast, and effective.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: UColors.textLightColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: UColors.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16,
                          color: UColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: UColors.backgroundGrayColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Sign in ",
                        style: TextStyle(
                          fontSize: 16,
                          color: UColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Small Terms Text
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: UColors.grayColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        TextSpan(text: 'By continuing, you agree to our '),
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
