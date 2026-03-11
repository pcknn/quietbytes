import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';

class NavigationBarTest extends StatelessWidget {
  const NavigationBarTest({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        NavigationDestination(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      backgroundColor: AppColors.purple,
    );
  }
}
