import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';

class CustomTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    // Username textfield
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ), // "Width/Lenght" of the button
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.pillBorderRadius),
            borderSide: const BorderSide(color: AppColors.lavender),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.pillBorderRadius),
            borderSide: const BorderSide(color: AppColors.gold),
          ),
          fillColor: AppColors.lavender,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.purple,
            fontFamily: 'Jersey20',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
