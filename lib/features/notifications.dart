import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';
import '../componets/custom_button.dart';
import '../componets/navigation_bar.dart';

//Rename and change Notifications to whatever you want and change it in the main.dart as well, just a template if needed
//To go back to the test page, click "Template Page", you can change the name and it will still work
class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
              Container(
                width: double.infinity,
                height: AppSpacing.topPillHeight,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.topPillTextPadding,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(
                    AppSpacing.pillBorderRadius,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/test');
                  },
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      color: AppColors.cream,
                      fontFamily: 'Jersey20',
                      fontSize: 30,
                    ),
                  ),
                ),
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
                        top: 50.0,
                      ), //How far the text is from the top of the purple pill
                      child: Column(
                        children: [
                          // ------ START HERE To Add NOTIFICATIONS --------


                          // ------ END HERE To Add NOTIFICATIONS --------
                          const SizedBox(height: 20.0), //Should be spacing between last notifications and button.
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

              //Bottom pill
              const SizedBox(height: AppSpacing.pillsSpacing),

              NavigationBarTest(),
            ],
          ),
        ),
      ),
    );
  }
}
