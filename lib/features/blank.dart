import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';
import '../componets/custom_headers.dart';

//Rename and change Blank to whatever you want and change it in the main.dart as well, just a template if needed
//To go back to the test page, click "Template Page", you can change the name and it will still work
class Blank extends StatelessWidget {
  const Blank({super.key});

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
              CustomHeaders(title: '"Home" Page', showSettings: true),

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
                          // ------ START HERE (I think)--------
                          Image.asset('assets/images/winnie2.PNG',
                          fit: BoxFit.fitHeight),
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
