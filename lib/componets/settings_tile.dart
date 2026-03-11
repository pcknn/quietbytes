import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.rose,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.cream, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Jersey20',
          color: AppColors.cream,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Jersey20',
          color: AppColors.cream.withValues(alpha: 0.8),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.horizontalPaddingWidth,
        vertical: 2.0,
      ),
      onTap: onTap,
    );
  }
}
