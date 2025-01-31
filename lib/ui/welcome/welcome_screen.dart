import 'package:flutter/material.dart';
import 'package:mono/ui/login/login_screen.dart';
import 'package:mono/ui/signup/signup_screen.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/widgets/text_widget.dart';

import '../../utils/image_constant.dart';
import '../../utils/utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static String routeName = '/welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: Utils.getDecorationBg(),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40,),
              Image.asset(Utils.getImagePath(ImageConstant.monoLogo)),
              const SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  // Redirect to login screen
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: CustomColor.themeColor,borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(child: TextWrapper(textShow: CustomString.signIn,height: 0,textColor: CustomColor.white,fontWeight: FontWeight.bold,fontSize: 14,)),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  // Redirect to signup screen
                  Navigator.pushNamed(context, SignupScreen.routeName);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: CustomColor.white,borderRadius: BorderRadius.circular(50),border: Border.all(color: CustomColor.themeColor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11.0),
                    child: Center(child: TextWrapper(textShow: CustomString.signUp,height: 0,textColor: CustomColor.themeColor,fontWeight: FontWeight.bold,fontSize: 14,)),
                  ),
                ),
              ),
              const SizedBox(height: 150,),
            ],
          ),
        ),
      ),
    );
  }
}
