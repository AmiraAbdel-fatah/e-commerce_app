import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/app_validator.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/data/di/di.dart';
import 'package:e_commerce/featuers/auth/register/cubit/register_state.dart';
import 'package:e_commerce/featuers/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../widgets/constant_manager.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading ...');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              title: 'Error',
              posActionName: 'Ok');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Register Successfully',
              title: 'Success',
              posActionName: 'Ok');
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              color: AppColors.primaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 90.h,
                    ),
                    Image.asset(AssetsManager.logo),
                    SizedBox(
                      height: 40.h,
                    ),
                    Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(ConstantManager.fullName,
                                style: AppStyles.medium18White),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextField(
                              hintText: ConstantManager.fullNameLabel,
                              validator: AppValidator.validateFullName,
                              controller: viewModel.fullNameController,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(ConstantManager.phoneNumber,
                                style: AppStyles.medium18White),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextField(
                              validator: AppValidator.validatePhoneNumber,
                              hintText: ConstantManager.phoneNumberLabel,
                              controller: viewModel.phoneController,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(ConstantManager.email,
                                style: AppStyles.medium18White),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextField(
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
                              validator: AppValidator.validatePassword,
                              hintText: ConstantManager.passwordLabel,
                              obSecureText: true,
                              controller: viewModel.passwordController,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.visibility_off)),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              ConstantManager.confirmPassword,
                              style: AppStyles.medium18White,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextField(
                              hintText: ConstantManager.confirmPasswordLabel,
                              validator: AppValidator.validatePassword,
                              obSecureText: true,
                              controller: viewModel.rePasswordController,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.visibility_off)),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomElevatedButton(
                              backgroundColor: AppColors.whiteColor,
                              textStyle: AppStyles.semi20Primary,
                              text: ConstantManager.signUp,
                              onButtonClicked: () {
                                viewModel.register();
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
