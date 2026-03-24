import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';
import '../componets/custom_button.dart';
import '../componets/notification_tile.dart';
import '../componets/custom_headers.dart';

//Rename and change Notifications to whatever you want and change it in the main.dart as well, just a template if needed
//To go back to the test page, click "Template Page", you can change the name and it will still work
class Notifications extends StatelessWidget {
  final VoidCallback? onBack;

  const Notifications({super.key, this.onBack});

  void clearNotifications(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.horizontalPaddingWidth,
            vertical: AppSpacing.verticalPaddingIsland,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Top pill (Template Page)
              CustomHeaders(
                title: 'Notifications',
                showBack: true,
                showSettings: true,
                onBack: onBack,
              ),

              const SizedBox(
                height: AppSpacing.pillsSpacing,
              ), // Spacing between the two pills
              //2nd Pill (Background pill, login, )
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      //height: AppSpacing.test,
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.pillBorderRadius,
                        ),
                      ),
                    ),

                    // Put whatever you want in the purple pill here (logo, text, buttons, etc.)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        bottom: 15.0,
                      ), //How far the text is from the top of the purple pill
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                // ------ START HERE To Add NOTIFICATIONS --------

                                // ---------- TESTING ----------
                                NotificationTile(
                                  text: 'New message from Alice',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text: 'Your order has been shipped',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text: 'Reminder: Meeting at 3 PM',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text: 'New comment on your post',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text:
                                      'Your password was changed successfully',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text: 'New friend request from Bob',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text:
                                      'Your subscription will expire in 3 days',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text: 'New message from Alice',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text: 'Your order has been shipped',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text: 'Reminder: Meeting at 3 PM',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text: 'New comment on your post',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text:
                                      'Your password was changed successfully',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text: 'New friend request from Bob',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                NotificationTile(
                                  text:
                                      'Your subscription will expire in 3 days',
                                  onTap: () {
                                    // Handle tap on this notification
                                  },
                                ),
                                //----- END OF TESTING --------

                                // ------ END HERE To Add NOTIFICATIONS --------
                              ],
                            ),
                          ),

                          const SizedBox(height: 15.0),
                          CustomButton(
                            text: 'Clear Notifications',
                            onTap: () => clearNotifications(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
