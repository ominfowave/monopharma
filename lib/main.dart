import 'package:flutter/material.dart';
import 'package:mono/ui/forgot%20password/forgot_password.dart';
import 'package:mono/ui/login/login_screen.dart';
import 'package:mono/ui/productDetail/product_detail.dart';
import 'package:mono/ui/signup/signup_screen.dart';
import 'package:mono/ui/splash/splash_screen.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';

import 'ui/dashboard/dashboard_screen.dart';
import 'ui/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title of app
      title: CustomString.appName,
      // By below code system text size will not be affected in app
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      // set theme color from here
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.themeColor),
          useMaterial3: true,
          brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        // --------------------------- Welcome Screen -----------------------------------------
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        // --------------------------- Login Screen -----------------------------------------
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        // --------------------------- Signup Screen -----------------------------------------
        SignupScreen.routeName: (ctx) => const SignupScreen(),
        // --------------------------- Dashboard Screen -----------------------------------------
        DashboardBaseScreen.routeName: (ctx) => const DashboardBaseScreen(),
        // --------------------------- ProductDetail Screen -----------------------------------------
        ProductDetail.routeName: (ctx) => const ProductDetail(),
        //-----------------------------Forgot password --------------------------------------------
        ForgotPassword.routeName: (ctx) => const ForgotPassword()
      },
    );
  }
}
