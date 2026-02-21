import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';

class WelcomeButton extends StatelessWidget {
  //final Function()? onTap;
  final VoidCallback onTap;

  const WelcomeButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60.0,
      ), // "Width/Lenght" of the button
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppSpacing.pillBorderRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.pillBorderRadius),
          splashColor: AppColors.purple.withValues(alpha: 0.4),
          highlightColor: AppColors.lavender.withValues(alpha: 0.1),
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(AppSpacing.pillBorderRadius),
            ),
            padding: const EdgeInsets.all(10), // "Height" of the button
            child: const Center(
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: AppColors.purple,
                  fontFamily: 'Jersey20',
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
