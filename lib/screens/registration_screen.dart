import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pthr/const.dart';
import 'package:pthr/screens/login_screen.dart';
import 'package:pthr/widgets/custom_button.dart';
import 'package:pthr/widgets/custom_text_form_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  var _password1Visible = true;
  var _password2Visible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text("Registration",style: keywordTextStyle.copyWith(fontSize: 24,color: Colors.blueGrey),),
                        )),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Username \*",
                        style: keywordTextStyle.copyWith(color: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      controller: _userController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your username ";
                        }
                      },
                      hintText: 'user name',
                      hintStyle: hintTextStyle.copyWith(color: Colors.blue),
                      preffixIcon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter your email \*",
                        style: keywordTextStyle.copyWith(color: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!value.contains("@")) {
                          return "Invalid Email ";
                        }
                      },
                      hintText: "abc@gmail.com",
                      hintStyle: hintTextStyle.copyWith(color: Colors.blue),
                      preffixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password \*",
                        style: keywordTextStyle.copyWith(color: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      obscureText: _password1Visible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 5) {
                          return "Your password is too short";
                        }
                      },
                      preffixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.blue,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _password1Visible == false
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            _password1Visible = !_password1Visible;
                          });
                        },
                      ),
                      hintText: 'Password',
                      hintStyle: hintTextStyle.copyWith(color: Colors.blue),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password \*",
                        style: keywordTextStyle.copyWith(color: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      controller: _passwordConfirmController,
                      obscureText: _password2Visible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 5) {
                          return "Your password is too short";
                        }
                        if (_passwordController.text !=
                            _passwordConfirmController.text) {
                          return "Both password are not same";
                        }
                      },
                      preffixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.blue,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _password2Visible == false
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            _password2Visible = !_password2Visible;
                          });
                        },
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: hintTextStyle.copyWith(color: Colors.blue),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // AutoSizeText(
                    //   "By signing up, you're agree to our Terms & Conditions and Privacy Policy",
                    //   style: keywordTextStyle,
                    // ),
                    RichText(
                        text: TextSpan(
                            text: "By signing up, you're agree to our ",
                            style:
                            keywordTextStyle.copyWith(color: Colors.blueGrey),
                            children: [
                              TextSpan(
                                  text: 'Terms & Conditions',
                                  style: keywordTextStyle.copyWith(
                                      color: Color(0xffFF6B6B)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         TermsConditionsScreen()));
                                    }),
                              TextSpan(
                                  text: " and ",
                                  style: keywordTextStyle.copyWith(
                                      color: Colors.blueGrey)),
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style: keywordTextStyle.copyWith(
                                      color: Color(0xffFF6B6B)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         PrivacyPolicyScreen()));
                                    }),
                            ])),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomButton(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            print("All fields are valid");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                          } else {
                            print("Something wrong");
                          }
                        },
                        buttonText: 'Sign Up',
                        myTextStyle: myTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Joined us before? ",
                            style:
                            keywordTextStyle.copyWith(color: Colors.blueGrey),
                            children: [
                              TextSpan(
                                  text: 'Login',
                                  style: keywordTextStyle.copyWith(
                                      color: Color(0xffFF6B6B)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                    })
                            ]))
                  ],
                ),
              ),
            ),
          ),
        )),);
  }
}
