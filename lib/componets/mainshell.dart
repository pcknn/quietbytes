import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';
import '../componets/navigation_bar.dart';
import '../componets/navigation_model.dart';

import '../features/blank.dart';
import '../features/notifications.dart';
import '../features/settings.dart';


class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _pageIndex = 0;

  // The pages in order matching your nav bar icons:
  // 0=Home, 1=Chat, 2=Notifications, 3=Settings
  final List<Widget> _pages = [
    const Blank(), //"home"
    const Placeholder(), //Chat
    const Notifications(),
    const Settings(), //swap out with Account
    const Placeholder(), //Plus
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: NavigationBarTest(
        pageIndex: _pageIndex,
        onTap: (index) {
          setState(() => _pageIndex = index);
        },
      ),
    );
  }
}
