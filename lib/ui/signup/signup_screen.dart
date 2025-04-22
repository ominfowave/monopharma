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
import 'package:intl/intl.dart';
import '../../model/state list/state_list_response.dart';
import '../../utils/shared_preference.dart';

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
  TextEditingController gst = TextEditingController();
  TextEditingController pan = TextEditingController();
  TextEditingController drivinglicence = TextEditingController();
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
    fetchStateList(); // Make sure this is being called
  }



  bool isLoading = false;
  bool isLoadingState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Utils.getDecorationBg(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:isLoadingState ? const Center(child: CircularProgressIndicator(color: CustomColor.themeColor,),) : Form(
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
                        readOnly: true,
                        isValidate: true,
                        isLabel: true,
                        fontSize: 15,
                        maxLength: 10,
                        hintText: CustomString.birthDate,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: CustomColor.prefixIconColor,
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.calendar_today,
                          color: CustomColor.themeColor,
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            builder: (context, child) {
                              return Theme(
                                  data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: CustomColor.themeColor.withOpacity(0.6), // header background color
                                  onPrimary: Colors.black, // header text color
                                  onSurface: CustomColor.themeColor, // body text color
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.red, // button text color
                                  ),
                                ),
                              ), child: child!, );
                            },
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy/MM/dd').format(pickedDate);
                            birthDate.text = formattedDate;
                          }
                        },
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
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: CustomColor.prefixIconColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
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

                                // Find the full state object
                                selectedState = stateListResponse.data?.firstWhere(
                                      (state) => state.stateName == currentSelectedState,
                                  orElse: () => StateData(), // Fallback if not found
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
                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: gst,
                        readOnly: false,
                        isLabel: true,
                        isValidate: true,
                        fontSize: 15,
                        maxLength: 15, // Updated here
                        hintText: CustomString.gstNumber,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: CustomColor.prefixIconColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyGstNumber;
                          }
                          return null;
                        },
                      ),


                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: pan,
                        readOnly: false,
                        isLabel: true,
                        isValidate: true,
                        fontSize: 15,
                        maxLength: 9, // Updated here
                        hintText: CustomString.panNumber,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: CustomColor.prefixIconColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyPanNumber;
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),
                      TextFieldWrapper(
                        textEditingController: drivinglicence,
                        readOnly: false,
                        isLabel: true,
                        isValidate: true,
                        fontSize: 15,
                        maxLength: 16, // Updated here
                        hintText: CustomString.drivingLicence,
                        hintColor: CustomColor.prefixIconColor,
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: CustomColor.prefixIconColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CustomString.errorEmptyDrivingLicence;
                          }
                          return null;
                        },
                      ),


                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              addRadioButton(1, 'Seller'),
                              addRadioButton(2, 'Distributor'),
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
                          if (gst.text.isEmpty) {
                            Utils.showToast('Enter a gstNumber');
                            return;
                          }
                          if (pan.text.isEmpty) {
                            Utils.showToast('Enter a panNumber');
                            return;
                          }
                          if (drivinglicence.text.isEmpty) {
                            Utils.showToast('Enter a drivingLicence');
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
                            gst.text,
                            pan.text,
                            drivinglicence.text,
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
                              child: isLoading ? const CircularProgressIndicator(color: Colors.white,) : TextWrapper(
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
      String gstNumber,
      String panNumber,
      String drivingLicence,
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
      gstNumber,
      panNumber,
      drivingLicence,
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
      isLoadingState = true;
    });
    try {

      ApiRepo("", null, baseUrl: MyApiUtils.baseUrl).state(
        context,
            (error) {
          setState(() {
            isLoadingState = false;
          });
          Utils.showToast("Server Error: $error");
        },
            (response) {
          setState(() {
            stateListResponse = response;
            isLoadingState = false;
          });
        },
      );
    } catch (error) {
      setState(() {
        isLoadingState = false;
      });
      print("Error fetching state list: $error");
    }
  }


}
