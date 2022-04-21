import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namcity_memorial/Utils/utils.dart';
import '../settings/app_theme.dart';
import '../widgets/auth/logo.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  String verificationIDReceived = "";

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 64 * h),
                const LogoWidget(),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 18 * h,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5 * w,
                            color: AppTheme.blackColor,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16 * w),
                              borderSide: BorderSide(
                                color: AppTheme.greyColor,
                                width: 1 * h,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.neutralColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16 * w),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.account_circle_rounded,
                              color: AppTheme.neutralColor,
                            ),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: AppTheme.blackColor,
                              fontSize: 18 * h,
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          cursorColor: AppTheme.blackColor,
                        ),
                        SizedBox(height: 12 * h),
                        TextFormField(
                          controller: surnameController,
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 18 * h,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5 * w,
                            color: AppTheme.blackColor,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16 * w),
                              borderSide: BorderSide(
                                color: AppTheme.greyColor,
                                width: 1 * h,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.neutralColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16 * w),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.account_circle_rounded,
                              color: AppTheme.neutralColor,
                            ),
                            labelText: 'Surname',
                            labelStyle: TextStyle(
                              color: AppTheme.blackColor,
                              fontSize: 18 * h,
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          cursorColor: AppTheme.blackColor,
                        ),
                        SizedBox(height: 12 * h),
                        TextFormField(
                          controller: phoneController,
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 18 * h,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5 * w,
                            color: AppTheme.blackColor,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16 * w),
                              borderSide: BorderSide(
                                color: AppTheme.greyColor,
                                width: 1 * h,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.neutralColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16 * w),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: AppTheme.neutralColor,
                            ),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              color: AppTheme.blackColor,
                              fontSize: 18 * h,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          cursorColor: AppTheme.blackColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 64,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  decoration: BoxDecoration(
                    color: AppTheme.greyColor,
                    borderRadius: BorderRadius.circular(16 * w),
                  ),
                  child: ElevatedButton(
                      onPressed: () async {
                        verifyNumber();
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          color: AppTheme.whiteColor,
                          fontSize: 16 * h,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5 * w,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth
            .signInWithCredential(credential)
            .then((value) => {print("You are logged in successfuly")});
      },
      verificationFailed: (FirebaseException exception) {
        print(exception.message);
      },
      codeSent: (String verificationID, int? resendToken) {
        verificationIDReceived = verificationID;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationID) {},
    );
  }
}
