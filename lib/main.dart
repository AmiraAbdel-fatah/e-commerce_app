import 'package:e_commerce/core/cache/shared_preference_utils.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/featuers/auth/login/login_screen.dart';
import 'package:e_commerce/featuers/pages/cart_screen/cart_screen.dart';
import 'package:e_commerce/featuers/pages/home_screen/home_screen.dart';
import 'package:e_commerce/featuers/pages/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/di/di.dart';
import 'featuers/auth/register/register_screen.dart';
import 'featuers/pages/cart_screen/cubit/cart_view_model.dart';
import 'featuers/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'featuers/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'myObserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferenceUtils.init();

  String routeName;
  var token = SharedPreferenceUtils.getData(key: 'token');
  if (token == null) {
    //ToDo: No user login
    routeName = AppRoutes.loginRoute;
  } else {
    // ToDo: token != null (user)
    routeName = AppRoutes.homeRoute;
  }

  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(providers: [
          BlocProvider<HomeTabViewModel>(
              create: (_) => getIt<HomeTabViewModel>()),
          BlocProvider<ProductTabViewModel>(
              create: (_) => getIt<ProductTabViewModel>()),
          BlocProvider<CartViewModel>(create: (_) => getIt<CartViewModel>()),
        ],
        child: MyApp(
          routeName: routeName,
        )),
  );
}

class MyApp extends StatelessWidget {
  String routeName;

  MyApp({required this.routeName});

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
            initialRoute: routeName,
            routes: {
              AppRoutes.loginRoute: (context) => LoginScreen(),
              AppRoutes.registerRoute: (context) => RegisterScreen(),
              AppRoutes.homeRoute: (context) => HomeScreen(),
              AppRoutes.productRoute: (context) => ProductDetailsScreen(),
              AppRoutes.cartRoute: (context) => CartScreen()
            },
          );
        });
  }
}
