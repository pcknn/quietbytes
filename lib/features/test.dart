import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';
import '../componets/custom_button.dart';

class Test extends StatelessWidget {
  const Test({super.key});

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
                child: const Text(
                  'Testing Page',
                  style: TextStyle(
                    color: AppColors.cream,
                    fontFamily: 'Jersey20',
                    fontSize: 30,
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
                          CustomButton(
                            text: 'Welcome Page',
                            routeName: '/welcome',
                          ),

                          const SizedBox(height: 20.0),
                          CustomButton(text: 'Login Page', routeName: '/login'),

                          const SizedBox(height: 20.0),
                          CustomButton(
                            text: 'Sign Up Page',
                            routeName: '/signup',
                          ),

                          const SizedBox(height: 20.0),
                          CustomButton(text: 'Blank Page', routeName: '/blank'),
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
