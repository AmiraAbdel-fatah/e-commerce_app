import 'package:e_commerce/core/cache/shared_preference_utils.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/featuers/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_validator.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  UserTabState createState() => UserTabState();
}

class UserTabState extends State<UserTab> {
  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetsManager.logo,
              height: 20.h,
            ),
            // SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Welcome, Amira', style: AppStyles.semi20Primary),
                IconButton(
                    onPressed: () {
                      // Todo: Remove token
                      SharedPreferenceUtils.removeData(key: 'token');
                      // Todo: Navigate to Login Screen
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.loginRoute, (route) => false);
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 30,
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
            Text('amira921@gmail.com', style: AppStyles.medium14PrimaryDark),
            SizedBox(height: 18.h),
            CustomTextField(
                borderColor: AppColors.primary30Opacity,
                readOnly: isFullNameReadOnly,
                filledColor: AppColors.whiteColor,
                hintText: 'Enter your full name',
                labelText: 'Full Name',
                controller: TextEditingController(text: 'Amira Abdel-Fattah'),
                labelStyle: AppStyles.regular18Primary,
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isFullNameReadOnly = false;
                    });
                  },
                ),
                keyboardType: TextInputType.text,
                validator: AppValidator.validateFullName,
                hintStyle: AppStyles.medium18White
                    .copyWith(color: AppColors.primaryColor)),
            SizedBox(height: 18.h),
            CustomTextField(
                borderColor: AppColors.primary30Opacity,
                readOnly: isEmailReadOnly,
                filledColor: AppColors.whiteColor,
                hintText: 'Enter your email address',
                labelText: 'E-mail address',
                controller: TextEditingController(text: 'amira921@gmail.com'),
                labelStyle: AppStyles.medium18PrimaryDark,
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEmailReadOnly = false;
                    });
                  },
                ),
                keyboardType: TextInputType.emailAddress,
                validator: AppValidator.validateEmail,
                hintStyle: AppStyles.medium18White
                    .copyWith(color: AppColors.primaryColor)),
            SizedBox(height: 18.h),
            CustomTextField(
              onTap: () {
                setState(() {
                  isPasswordReadOnly = false;
                });
              },
              controller: TextEditingController(text: '123456789123456'),
              borderColor: AppColors.primaryColor,
              readOnly: isPasswordReadOnly,
              filledColor: AppColors.whiteColor,
              hintText: 'Enter your password',
              labelText: 'Password',
              obSecureText: true,
              labelStyle: AppStyles.medium18White
                  .copyWith(color: AppColors.primaryColor),
              suffixIcon: Icon(Icons.edit_rounded),
              keyboardType: TextInputType.text,
              validator: AppValidator.validatePassword,
              hintStyle: AppStyles.medium18White
                  .copyWith(color: AppColors.primaryColor),
            ),
            SizedBox(height: 18.h),
            CustomTextField(
                controller: TextEditingController(text: '01122139855'),
                borderColor: AppColors.primaryColor,
                readOnly: isMobileNumberReadOnly,
                filledColor: AppColors.whiteColor,
                hintText: 'Enter your mobile no.',
                labelText: 'Your mobile number',
                labelStyle: AppStyles.medium18White
                    .copyWith(color: AppColors.primaryColor),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit_rounded),
                  onPressed: () {
                    setState(() {
                      isMobileNumberReadOnly = false;
                    });
                  },
                ),
                keyboardType: TextInputType.phone,
                validator: AppValidator.validatePhoneNumber,
                hintStyle: AppStyles.medium18White
                    .copyWith(color: AppColors.primaryColor)),
            SizedBox(height: 18.h),
            CustomTextField(
                controller:
                    TextEditingController(text: 'Damnhour, street 11.....'),
                borderColor: AppColors.primary30Opacity,
                readOnly: isAddressReadOnly,
                filledColor: AppColors.whiteColor,
                hintText: 'Damnhour, street 11.....',
                labelText: 'Your Address',
                labelStyle: AppStyles.medium18White
                    .copyWith(color: AppColors.primaryColor),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isAddressReadOnly = false;
                    });
                  },
                ),
                keyboardType: TextInputType.streetAddress,
                validator: AppValidator.validateFullName,
                hintStyle: AppStyles.medium18White
                    .copyWith(color: AppColors.primaryColor)),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
