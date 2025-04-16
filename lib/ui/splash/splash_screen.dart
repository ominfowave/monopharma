import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/utils/utils.dart';
import 'package:mono/widgets/text_widget.dart';

import '../../utils/colors.dart';
import '../../utils/image_constant.dart';
import '../../utils/shared_preference.dart';
import '../dashboard/dashboard_screen.dart';
import '../welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // pref var
  SharedPref prefs = SharedPref();
  bool? isLogin;

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2),
            () async{
          isLogin = await prefs.getAlreadyLogin();
          if(isLogin ?? false){
            Navigator.pushReplacementNamed(context, DashboardBaseScreen.routeName);
          }else{
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          }
        });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Utils.getDecorationBg(),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Utils.getImagePath(ImageConstant.monoLogo)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: TextWrapper(
              textShow: CustomString.weCare,
              textColor: CustomColor.themeColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
