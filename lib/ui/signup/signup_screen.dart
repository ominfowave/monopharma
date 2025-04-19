import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/ui/login/login_screen.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/utils/utils.dart';
import 'package:mono/widgets/custom_textfield_widget.dart';
import 'package:mono/widgets/text_widget.dart';
import '../../Api/api_repo.dart';
import '../../Api/my_api_utils.dart';
import '../../model/register/register_response.dart';

import '../../model/state list/state_list_response.dart';
import '../../utils/shared_preference.dart';
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
  SharedPref prefs = SharedPref();
  RegisterResponse registerResponse = RegisterResponse();
  int? _selectedValue = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  StateListResponse stateListResponse = StateListResponse();
  String? currentSelectedState;
  StateData? selectedState;
  List<String> states = [];

  @override
  void initState() {
    super.initState();
    fetchStateList();

  }


  bool isLoading = false;

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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        isEmpty: currentSelectedState == null,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: CustomColor.white,
                            value: currentSelectedState,
                            isDense: true,
                            hint: Text('Please select state', style: GoogleFonts.poppins()),
                            onChanged: (String? newValue) {
                              setState(() {
                                currentSelectedState = newValue;

                                // Find the corresponding division name based on the selected segment
                                selectedState = stateListResponse.data?.firstWhere(
                                      (state) => state.stateName == currentSelectedState,
                                );


                              });
                            },
                            items: (stateListResponse.data ?? []).map((state) {
                              return DropdownMenuItem<String>(
                                value: state.stateName,
                                child: Text(state.stateName ?? '', style: GoogleFonts.poppins(fontSize: 14)),
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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
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
                          borderSide: const BorderSide(
                              color: CustomColor.prefixIconColor),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyCity;
                          }
                          return null;
                        },
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              addRadioButton(0, 'Seller'),
                              addRadioButton(1, 'Distributor'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          if (firmName.text.isEmpty) {
                            Utils.showToast('Enter a firmName');
                            return;
                          }
                          if (fullName.text.isEmpty) {
                            Utils.showToast('Enter a fullName');
                            return;
                          }
                          if (email.text.isEmpty) {
                            Utils.showToast('Enter a email');
                            return;
                          }
                          if (whatsappNo.text.isEmpty) {
                            Utils.showToast('Enter a whatsappNo');
                            return;
                          }
                          if (birthDate.text.isEmpty) {
                            Utils.showToast('Enter a birthDate');
                            return;
                          }
                          if (city.text.isEmpty) {
                            Utils.showToast('Enter a city');
                            return;
                          }
                          if (address.text.isEmpty) {
                            Utils.showToast('Enter a address');
                            return;
                          }
                          if (pinCode.text.isEmpty) {
                            Utils.showToast('Enter a pinCode');
                            return;
                          }
                          if (password.text.isEmpty) {
                            Utils.showToast('Enter a password');
                            return;
                          }
                          if (confirmPassword.text.isEmpty) {
                            Utils.showToast('Enter a confirmPassword');
                            return;
                          }


                          register(
                            firmName.text,
                            fullName.text,
                            email.text,
                            whatsappNo.text,
                            birthDate.text,
                            city.text,
                            address.text,
                            pinCode.text,
                            password.text,
                            confirmPassword.text,

                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: CustomColor.themeColor,
                              borderRadius: BorderRadius.circular(50)),
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
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
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

  Widget addRadioButton(int value, String label) {
    bool isSelected = _selectedValue == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedValue = value;
        });
      },
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
              color: isSelected ? Colors.red : Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(label),
          SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  Future<void> register(
      String firmName,
      String fullName,
      String email,
      String whatsappNo,
      String birthDate,
      String city,
      String address,
      String pincode,
      String password,
      String cPassword,
      ) async {
    int stateId = selectedState?.id ?? 0;
    int role = _selectedValue ?? 0;

    setState(() {
      isLoading = true;
    });

    // Call the API
    await ApiRepo("", null, baseUrl: MyApiUtils.baseUrl).register(
      context,
      firmName,
      fullName,
      email,
      whatsappNo,
      birthDate,
      stateId,
      city,
      address,
      pincode,
      role,
      password,
      cPassword,
          (error) {
        setState(() {
          isLoading = false;
        });
        print('API Error:$error');
        Utils.showToast("Server Error: $error");
      },
          (response) {
        setState(() {
          registerResponse = response;
          isLoading = false;
        });

        if(registerResponse.result == "success" && registerResponse.message == "User Created Successfully!") {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }

        // Handle success response
        if (response is RegisterResponse) {
          Utils.showToast(response.message ?? "Signup successfully");
        }
      },
    );
  }
  Future<void> fetchStateList() async {
    setState(() {
      isLoading = true;
    });
    try {
      String? token = await prefs.getToken();
      ApiRepo(token, null, baseUrl: MyApiUtils.baseUrl).state(
        context,
            (error) {
          setState(() {
            isLoading = false;
          });
          Utils.showToast("Server Error: $error");
        },
            (response) {
          setState(() {
            stateListResponse = response;
            isLoading = false;
          });
        },
      );
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching state list: $error");
    }
  }


}
