import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/featuers/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'featuers/auth/register/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            initialRoute: AppRoutes.loginRoute,
            routes: {
              AppRoutes.loginRoute: (context) => LoginScreen(),
              AppRoutes.registerRoute: (context) => RegisterScreen(),
            },
          );
        });
  }
}
