import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/ui/login/login_screen.dart';

import '../../Api/api_repo.dart';
import '../../Api/my_api_utils.dart';
import '../../model/forgotpassword/forgot_password_response.dart';
import '../../utils/colors.dart';
import '../../utils/custom_strings.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';
import '../../widgets/text_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  static String routeName = '/forgot_password';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  ForgotPasswordResponse forgotPasswordResponse = ForgotPasswordResponse();
  SharedPref prefs = SharedPref();

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
                      textShow: CustomString.forgot,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      textColor: CustomColor.themeColor,
                    ),
                    const SizedBox(height: 80),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextWrapper(
                        textShow: CustomString.email,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        textColor: CustomColor.userNamePassTextColor,
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: CustomString.emailId,
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
                    const SizedBox(height: 80),
                    GestureDetector(
                      onTap: () {
                        if (emailController.text.isEmpty) {
                          Utils.showToast('Enter an email');
                          return;
                        }
                        forgot(emailController.text);

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
                                  textShow: CustomString.submitButton,
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
          ],
        ),
      ),
    );
  }

  Future<void> forgot(String email) async {
    setState(() {
      isLoading = true;
    });

    await ApiRepo("", null, baseUrl: MyApiUtils.baseUrl).forgotPassword(
      context,
      email,
          (error) {
        setState(() {
          isLoading = false;
        });
        print('API Error: $error');
        Utils.showToast("Server Error: $error");
      },
          (response) {
        setState(() {
          forgotPasswordResponse = response;
          isLoading = false;
        });

        if (response is ForgotPasswordResponse) {
          Utils.showToast(response.message ?? "Request sent");
          if (response.result == "success") {
            prefs.setRole(true);
            Navigator.pop(context); // Go back to previous screen
          }
        }

          },
    );
  }

}
