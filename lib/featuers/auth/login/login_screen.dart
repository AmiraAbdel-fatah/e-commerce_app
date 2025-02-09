import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_routes.dart';
import '../../widgets/constant_manager.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 61.h, bottom: 57.h, left: 97.w, right: 97.w),
              child: Image.asset(AssetsManager.logo),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    ConstantManager.welcomeMessage,
                    style: AppStyles.semi24White,
                  ),
                  Text(ConstantManager.askForSignIn,
                      style: AppStyles.light16White),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        ConstantManager.userName,
                        style: AppStyles.medium18White,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        filledColor: AppColors.whiteColor,
                        hintText: ConstantManager.userNameLabel,
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        ConstantManager.password,
                        style: AppStyles.medium18White,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        hintText: ConstantManager.passwordLabel,
                        // hintStyle: AppStyles.light16White,
                        obSecureText: true,
                        controller: passwordController,
                        filledColor: AppColors.whiteColor,
                        suffixIcon: ImageIcon(AssetImage((AssetsManager.view))),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.forgetPasswordRoute);
                        },
                        child: Text(
                          ConstantManager.forgetPassword,
                          style: AppStyles.regular18White,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      CustomElevatedButton(
                          backgroundColor: AppColors.whiteColor,
                          text: ConstantManager.login,
                          textStyle: AppStyles.semi20Primary,
                          onButtonClicked: () {}
                          //viewModel.login,
                          ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ConstantManager.dontHaveAccount,
                            style: AppStyles.light16White,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.registerRoute);
                            },
                            child: Text(
                              ConstantManager.createAccount,
                              style: AppStyles.light16White,
                            ),
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
