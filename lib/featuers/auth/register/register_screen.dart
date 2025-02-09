import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../widgets/constant_manager.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      key: formKey,
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
                            controller: fullNameController,
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
                            hintText: ConstantManager.phoneNumberLabel,
                            controller: phoneController,
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
                            // obscureText: true,
                            controller: passwordController,
                            suffixIcon:
                                ImageIcon(AssetImage(AssetsManager.view)),
                            // show: true,
                            // SuffixIconShowed: const ImageIcon(
                            //     AssetImage(IconAssets.hide)),
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
                            //obscureText: true,
                            controller: rePasswordController,
                            suffixIcon: ImageIcon(
                              AssetImage((AssetsManager.view)),
                            ),
                            // show: true,
                            // SuffixIconShowed: const ImageIcon(
                            //   AssetImage((IconAssets.hide)),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomElevatedButton(
                            backgroundColor: AppColors.whiteColor,
                            textStyle: AppStyles.semi20Primary,
                            text: ConstantManager.signUp,
                            onButtonClicked: () {},
                            // onPressed: () {
                            //   viewModel.signUp();}
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
    );
  }
}
