import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../componets/navigation_bar.dart';
import '../componets/navigation_model.dart';

import '../features/blank.dart';
import '../features/notifications.dart';
import '../features/chat.dart';
import '../features/profile.dart';


class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _pageIndex = 0;
  final List<int> _history = [];

  void _navigateTo(int index) {
    if(_pageIndex == index) return;
    setState(() {
      _history.add(_pageIndex);
      _pageIndex = index;
    });
  }

  void _goBack() {
    if(_history.isEmpty) return;
    setState(() {
      _pageIndex = _history.removeLast();
    });
  }

  // The pages in order matching your nav bar icons:
  // 0=Home, 1=Chat, 2=Notifications, 3=Settings
  List<Widget> _buildPages() => [
    const Blank(), //"home"
    Chat(onBack: _goBack), //Chat
    Notifications(onBack: _goBack),
    Profile(onBack: _goBack), //swap out with Account
    const Placeholder(), //Plus
  ];

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages();

    return Scaffold(
      backgroundColor: AppColors.lavender,
      body: pages[_pageIndex],
      bottomNavigationBar: NavigationBarTest(
        pageIndex: _pageIndex,
        onTap: (index) => _navigateTo(index,)
      ),
    );
  }
}
