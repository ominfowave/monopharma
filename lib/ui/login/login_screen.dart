import 'package:flutter/material.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/utils/utils.dart';
import 'package:mono/widgets/custom_textfield_widget.dart';
import 'package:mono/widgets/text_widget.dart';

import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // username controller
  TextEditingController userNameController = TextEditingController();

  // password controller
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Utils.getDecorationBg(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWrapper(
                  textShow: CustomString.login,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  textColor: CustomColor.themeColor,
                ),
                const SizedBox(
                  height: 80,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWrapper(
                    textShow: CustomString.userName,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    textColor: CustomColor.userNamePassTextColor,
                  ),
                ),
                TextFieldWrapper(
                  textEditingController: userNameController,
                  readOnly: false,
                  isValidate: false,
                  hintText: CustomString.userNameHint,
                  fontSize: 14,
                  maxLength: 25,
                  edgeInsetsGeometry: const EdgeInsets.only(top: 15),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: CustomColor.prefixIconColor,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWrapper(
                    textShow: CustomString.password,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    textColor: CustomColor.userNamePassTextColor,
                  ),
                ),
                TextFieldWrapper(
                  textEditingController: passwordController,
                  readOnly: false,
                  isValidate: false,
                  hintText: CustomString.passwordHint,
                  fontSize: 14,
                  maxLength: 25,
                  edgeInsetsGeometry: const EdgeInsets.only(top: 15),
                  textInputType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: CustomColor.prefixIconColor,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextWrapper(
                    textShow: CustomString.forgotPassword,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    textColor: CustomColor.userNamePassTextColor,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                GestureDetector(
                  onTap: () {
                    // Redirect to Dashboard
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: CustomColor.themeColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Center(
                          child: TextWrapper(
                        textShow: CustomString.loginButton,
                        height: 0,
                        textColor: CustomColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                    ),
                  ),
                ),
              ],
            )),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWrapper(
                      textShow: CustomString.doNotHaveAcc,
                      textColor: CustomColor.doNotAccTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Redirect to signup screen
                        Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                      child: TextWrapper(
                        textShow: CustomString.signUpNow,
                        textColor: CustomColor.themeColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
