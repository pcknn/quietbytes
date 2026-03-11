import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/spacing.dart';
import '../componets/custom_textfield.dart';
import '../componets/custom_button.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(
    BuildContext context,
  ) {} // Temporary does nothing until AUTH is implemented

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
              //Top pill (Welcome to QuietBytes!)
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
                  'Welcome to QuietBytes!',
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
                      margin: const EdgeInsets.only(
                        top: 20,
                      ), // To create a slight overlap with the top pill
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.pillBorderRadius,
                        ),
                      ),
                    ),

                    // Login Features

                    // Logo
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 120.0,
                      ), //Where the logo is placed, could be adjusted later
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 80,
                              color: AppColors.gold,
                            ),

                            // Username textfield
                            const SizedBox(
                              height: 140,
                            ), // Where the textfields are placed based of logo, could be adjusted later
                            CustomTextfield(
                              controller: usernameController,
                              hintText: 'Username',
                              
                              obscureText: false,
                            ),

                            // Password textfield
                            const SizedBox(
                              height: 20,
                            ), // Distance between the two textfields, could be adjusted later
                            CustomTextfield(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                              showToggle: true,
                            ),

                            // Forgot password?
                            const SizedBox(
                              height: 10,
                            ), // Distance between the password textfield and the "Forgot password?" text, could be adjusted later
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed:
                                        () {}, // Temporary does nothing, will be changed later to actually take the user to the forgot password page
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all(
                                        EdgeInsets.zero,
                                      ),
                                      minimumSize: WidgetStateProperty.all(
                                        Size.zero,
                                      ),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      overlayColor:
                                          WidgetStateProperty.resolveWith((
                                            states,
                                          ) {
                                            if (states.contains(
                                              WidgetState.pressed,
                                            )) {
                                              return AppColors.purple
                                                  .withValues(alpha: 0.4);
                                            }
                                            return null;
                                          }),
                                      foregroundColor:
                                          WidgetStateProperty.resolveWith((
                                            states,
                                          ) {
                                            if (states.contains(
                                              WidgetState.pressed,
                                            )) {
                                              return AppColors.gold;
                                            }
                                            return AppColors.cream;
                                          }),
                                    ),
                                    child: Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                        fontFamily: 'Jersey20',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Login button
                            const SizedBox(
                              height: 50,
                            ), // Distance between the "Forgot password?" text and the login button, could be adjusted later
                            CustomButton(
                              text: 'Login',
                              onTap: () => signUserIn(
                                context,
                              ), // Temporary does nothing until AUTH is implemented
                            ),
                            // Not a member? Register now "Text Button"
                            const SizedBox(
                              height: 10,
                            ), // Distance between the logi button and the Divider, could be adjusted later
                            Divider(
                              color: AppColors.cream.withValues(alpha: 0.2),
                              thickness: 1,
                              indent: 60,
                              endIndent: 60,
                            ),
                            const SizedBox(
                              height: 5,
                            ), // Distance between the Divider and the "Not a member? Register now" text, could be adjusted later
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Not a member?',
                                    style: TextStyle(
                                      color: AppColors.cream,
                                      fontFamily: 'Jersey20',
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 4),

                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/signup');
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all(
                                        EdgeInsets.zero,
                                      ),
                                      minimumSize: WidgetStateProperty.all(
                                        Size.zero,
                                      ),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      overlayColor:
                                          WidgetStateProperty.resolveWith((
                                            states,
                                          ) {
                                            if (states.contains(
                                              WidgetState.pressed,
                                            )) {
                                              return AppColors.purple
                                                  .withValues(alpha: 0.4);
                                            }
                                            return null;
                                          }),
                                      foregroundColor:
                                          WidgetStateProperty.resolveWith((
                                            states,
                                          ) {
                                            if (states.contains(
                                              WidgetState.pressed,
                                            )) {
                                              return AppColors.cream;
                                            }
                                            return AppColors.gold;
                                          }),
                                    ),
                                    child: Text(
                                      'Register now',
                                      style: TextStyle(
                                        fontFamily: 'Jersey20',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
