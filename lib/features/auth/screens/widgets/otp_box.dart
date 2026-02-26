import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpBox extends StatelessWidget {
  const OtpBox({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.nextFocus,
    required this.prevFocus,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final FocusNode? prevFocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 56,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xFF111318),
        ),
        decoration: InputDecoration(
          counterText: '',
          hintText: '–',
          hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 18),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF135BEC), width: 2),
          ),
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          if (value.isNotEmpty && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          } else if (value.isEmpty && prevFocus != null) {
            FocusScope.of(context).requestFocus(prevFocus);
          }
        },
      ),
    );
  }
}
