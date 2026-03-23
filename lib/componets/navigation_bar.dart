import 'dart:io';

import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';

class NavigationBarTest extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavigationBarTest({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: Platform.isAndroid ? 16 : 0,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        padding: EdgeInsets.zero,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(50),
          child: Container(
            height: 64,
            color: AppColors.purple,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navItem(
                  Icons.home_outlined,
                  pageIndex == 0,
                  onTap: () => onTap(0),
                ),
                navItem(
                  Icons.message_outlined,
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
                GestureDetector(
                  onTap: () => onTap(4),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.rose
                    ),
                    child: const Icon(Icons.add,
                    color: AppColors.cream,
                    size: 28,
                    ),
                  ),
                ),
                navItem(
                  Icons.notifications_none_outlined,
                  pageIndex == 2,
                  onTap: () => onTap(2),
                ),
                navItem(
                  Icons.person_outlined,
                  pageIndex == 3,
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: selected ? Colors.white : Colors.white.withValues(alpha: 0.4),
      ),
    ),
  );
}
