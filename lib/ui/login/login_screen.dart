import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/ui/dashboard/dashboard_screen.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/utils/utils.dart';
import 'package:mono/widgets/text_widget.dart';

import '../../Api/api_repo.dart';
import '../../Api/my_api_utils.dart';
import '../../model/login/login_response.dart';
import '../../utils/shared_preference.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  LoginResponse loginResponse = LoginResponse();
  SharedPref prefs = SharedPref();
  bool isLoading = false;

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWrapper(
                      textShow: CustomString.login,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      textColor: CustomColor.themeColor,
                    ),
                    const SizedBox(height: 80),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextWrapper(
                        textShow: CustomString.userName,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        textColor: CustomColor.userNamePassTextColor,
                      ),
                    ),
                    TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: CustomString.userNameHint,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: CustomColor.prefixIconColor,
                          size: 20,
                        ),
                        counterText: "",
                        contentPadding: const EdgeInsets.only(top: 15),
                      ),
                      style: GoogleFonts.poppins(
                        color: CustomColor.userNamePassTextColor,
                        fontSize: 14,
                      ),
                      maxLength: 25,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return CustomString.errorEmptyUserName;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextWrapper(
                        textShow: CustomString.password,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        textColor: CustomColor.userNamePassTextColor,
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        hintText: CustomString.passwordHint,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: CustomColor.prefixIconColor,
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: CustomColor.themeColor,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                        counterText: "",
                        contentPadding: const EdgeInsets.only(top: 15),
                      ),
                      style: GoogleFonts.poppins(
                        color: CustomColor.userNamePassTextColor,
                        fontSize: 14,
                      ),
                      maxLength: 25,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return CustomString.errorEmptyPassword;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextWrapper(
                        textShow: CustomString.forgotPassword,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        textColor: CustomColor.userNamePassTextColor,
                      ),
                    ),
                    const SizedBox(height: 80),
                    GestureDetector(
                      onTap: () {

                        if (userNameController.text.isEmpty) {
                          Utils.showToast('Enter a Username');
                          return;
                        }
                        if (passwordController.text.isEmpty) {
                          Utils.showToast('Enter a password');
                          return;
                        }
                          login(userNameController.text, passwordController.text);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: CustomColor.themeColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Center(
                          child: isLoading
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                              : TextWrapper(
                            textShow: CustomString.loginButton,
                            height: 0,
                            textColor: CustomColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                      child: TextWrapper(
                        textShow: CustomString.signUpNow,
                        textColor: CustomColor.themeColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> login(String username ,String password) async {
    setState(() {
      isLoading = true;
    });
    // Call the API
    await ApiRepo("", null, baseUrl: MyApiUtils.baseUrl).login(
      context,
      userNameController.text,
      passwordController.text,

          (error) {
        setState(() {
          isLoading = false;
        });
        print('API Error:$error');
        Utils.showToast("Server Error: $error");
      },
          (response) {
        setState(() {
          loginResponse = response;
          isLoading = false;
        });
        if(loginResponse.result == "success" && loginResponse.message == "User Login Successfully!") {
          prefs.setToken("Bearer ${loginResponse.data!.token!}");
          prefs.setUserInfo(loginResponse);

          Navigator.pushNamed(context, DashboardBaseScreen.routeName);
          prefs.setRole(true);
        }

        // Handle success response
        if (response is LoginResponse) {
          Utils.showToast(response.message ?? "login successfully");
        }
      },
    );
  }

}
