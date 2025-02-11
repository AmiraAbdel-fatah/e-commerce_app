import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/app_validator.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/data/di/di.dart';
import 'package:e_commerce/featuers/auth/login/cubit/login_state.dart';
import 'package:e_commerce/featuers/auth/login/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Waiting....');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              title: 'Error',
              posActionName: 'Ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Login Successfully.',
              title: 'Success',
              posActionName: 'Ok',
              posAction: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
              });
        }
      },
      child: Scaffold(
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
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              ConstantManager.email,
                              style: AppStyles.medium18White,
                            ),
                            SizedBox(height: 8.h),
                            CustomTextField(
                              filledColor: AppColors.whiteColor,
                              hintText: ConstantManager.emailLabel,
                              controller: viewModel.emailController,
                              validator: AppValidator.validateEmail,
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
                              obSecureText: true,
                              controller: viewModel.passwordController,
                              validator: AppValidator.validatePassword,
                              filledColor: AppColors.whiteColor,
                              suffixIcon:
                                  ImageIcon(AssetImage((AssetsManager.view))),
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
                                onButtonClicked: () {
                                  viewModel.login();
                                }),
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
      ),
    );
  }
}
