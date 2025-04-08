import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/ui/login/login_screen.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/utils/utils.dart';
import 'package:mono/widgets/custom_textfield_widget.dart';
import 'package:mono/widgets/text_widget.dart';
import '../dashboard/dashboard_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static String routeName = '/signup_screen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firmName = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController whatsappNo = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pinCode = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var states = ["Gujarat", "Maharashtra"];
  String currentSelectedValue = "Gujarat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Utils.getDecorationBg(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              TextWrapper(
                textShow: CustomString.registration,
                fontSize: 40,
                textColor: CustomColor.themeColor,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 15),
              TextWrapper(
                textShow: CustomString.createNewAccount,
                fontSize: 14,
                textColor: CustomColor.doNotAccTextColor,
                fontWeight: FontWeight.w600,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      TextFieldWrapper(
                        textEditingController: firmName,
                        readOnly: false,
                        isLabel: true,
                        isValidate: true,
                        fontSize: 15,
                        maxLength: 25,
                        hintText: CustomString.firmName,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyFirmName;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: fullName,
                        readOnly: false,
                        isValidate: true,
                        isLabel: true,
                        fontSize: 15,
                        maxLength: 25,
                        hintText: CustomString.fullName,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyFullName;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: email,
                        readOnly: false,
                        isValidate: true,
                        isLabel: true,
                        fontSize: 15,
                        maxLength: 25,
                        hintText: CustomString.email,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyEmail;
                          } else if (!isValidEmail(value)) {
                            return CustomString.errorValidEmail;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: whatsappNo,
                        readOnly: false,
                        isValidate: true,
                        isLabel: true,
                        fontSize: 15,
                        maxLength: 10,
                        hintText: CustomString.whatsappNo,
                        hintColor: CustomColor.prefixIconColor,
                        textInputType: TextInputType.number,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyWhatsappNo;
                          } else if (value.length < 10) {
                            return CustomString.errorValidWhatsappNo;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: birthDate,
                        readOnly: false,
                        isValidate: true,
                        isLabel: true,
                        fontSize: 15,
                        maxLength: 10,
                        hintText: CustomString.birthDate,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyBirthDate;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: password,
                        readOnly: false,
                        isLabel: true,
                        isValidate: true,
                        fontSize: 15,
                        maxLength: 25,
                        hintText: CustomString.password,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyPassword;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: confirmPassword,
                        readOnly: false,
                        isValidate: true,
                        isLabel: true,
                        fontSize: 15,
                        maxLength: 25,
                        hintText: CustomString.confirmPassword,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyPassword;
                          } else if (value.toString() != password.text) {
                            return CustomString.errorSamePassword;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      InputDecorator(
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                          errorStyle: GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                          hintText: 'Please select State',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                          ),
                        ),
                        isEmpty: currentSelectedValue == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: CustomColor.white,
                            value: currentSelectedValue,
                            isDense: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                currentSelectedValue = newValue!;
                              });
                            },
                            items: states.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: city,
                        readOnly: false,
                        isValidate: true,
                        isLabel: true,
                        fontSize: 15,
                        maxLength: 25,
                        hintText: CustomString.city,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyCity;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: address,
                        readOnly: false,
                        isValidate: true,
                        isLabel: true,
                        fontSize: 15,
                        maxLines: 3,
                        hintText: CustomString.address,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyCity;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: pinCode,
                        readOnly: false,
                        isLabel: true,
                        isValidate: true,
                        fontSize: 15,
                        maxLength: 6,
                        textInputType: TextInputType.number,
                        hintText: CustomString.pinCode,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyCity;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.pushNamed(context, DashboardBaseScreen.routeName);
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: CustomColor.themeColor, borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 11.0),
                            child: Center(
                              child: TextWrapper(
                                textShow: CustomString.signUp,
                                height: 0,
                                textColor: CustomColor.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWrapper(
                            textShow: CustomString.alreadyHaveAccount,
                            textColor: CustomColor.doNotAccTextColor,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginScreen.routeName);
                            },
                            child: TextWrapper(
                              textShow: CustomString.loginButton,
                              textColor: CustomColor.themeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return regex.hasMatch(email);
  }
}