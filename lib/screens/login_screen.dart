import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../res/color.dart';
import '../res/routes/app_.routes.dart';
import '../widgets/button/custom_rounded_button.dart';
import '../widgets/input_fields/input_text_field.dart';
import '../widgets/text/custom_big_text.dart';
import '../widgets/text/custom_small_text.dart';
import '../widgets/text/double_text.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Image.asset(
                      'assets/images/addlens.jpeg',
                      width: 60.h,
                    ),

                    SizedBox(height: 20.h),

                    // White container
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r),
                          ),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 60.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomBigText(
                                        text: 'Welcome!',
                                        fontSize: 30.sp,
                                      ),
                                      CustomSmallText(
                                        text: 'Please sign-in to continue',
                                        fontSize: 15.sp,
                                      ),
                                      SizedBox(height: 30.h),

                                      CustomTextField(
                                        controller: emailController,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Please enter an email';
                                          }
                                          final email = value.trim();
                                          final basicEmailRegex = RegExp(
                                            r'^[^@]+@[^@]+\.[^@]+$',
                                          );
                                          if (!basicEmailRegex.hasMatch(email)) {
                                            return 'Enter a valid email';
                                          }
                                          final lower = email.toLowerCase();
                                          if (!lower.endsWith('@gmail.com') &&
                                              !lower.endsWith(
                                                '@googlemail.com',
                                              )) {
                                            return 'Please enter a Gmail address';
                                          }
                                          return null;
                                        },
                                        hintText: 'Email address',
                                        suffixImage: 'assets/images/email.png',
                                      ),
                                      SizedBox(height: 35.h),

                                      CustomTextField(
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.trim().isEmpty) {
                                            return 'Please enter a password';
                                          }
                                          final password = value.trim();

                                          if (password.length < 8) {
                                            return 'Password must be at least 8 characters long';
                                          }
                                          if (!RegExp(r'[A-Z]').hasMatch(password)) {
                                            return 'Password must contain at least one uppercase letter';
                                          }
                                          if (!RegExp(r'[a-z]').hasMatch(password)) {
                                            return 'Password must contain at least one lowercase letter';
                                          }
                                          if (!RegExp(r'\d').hasMatch(password)) {
                                            return 'Password must contain at least one digit';
                                          }
                                          if (!RegExp(r'[!@#\$&*~%^.,;:_\-]').hasMatch(password)) {
                                            return 'Password must contain at least one special character';
                                          }
                                          return null;
                                        },
                                        hintText: 'Password',
                                        suffixImage:
                                            'assets/images/password.png',
                                      ),
                                      SizedBox(height: 5.h),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Fixed bottom content
                              Column(
                                children: [
                                  DoubleText(
                                    fstText: "Don't have an account?",
                                    lstText: 'Sign Up',
                                    onTap: () {
                                      // Navigator.pushNamed(context, AppRoutes.signUp);
                                    },
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomRoundedButton(
                                    btnName: 'Log In',
                                    onPress: () {
                                     if(_key.currentState!.validate()){
                                       Navigator.pushNamedAndRemoveUntil(
                                         context,
                                         AppRoutes.homeScreen,
                                             (route) => false,
                                       );
                                     }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
