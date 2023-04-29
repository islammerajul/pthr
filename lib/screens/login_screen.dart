import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pthr/const.dart';
import 'package:pthr/models/login_model.dart';
import 'package:pthr/screens/registration_screen.dart';
import 'package:pthr/widgets/custom_button.dart';
import 'package:pthr/widgets/custom_text_form_field.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  var _password1Visible = true;
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter your email \*",
                          style:
                          keywordTextStyle.copyWith(color: Colors.blueGrey),
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
                        hintStyle:
                        hintTextStyle.copyWith(color: Colors.blue),
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
                          style:
                          keywordTextStyle.copyWith(color: Colors.blueGrey),
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
                        hintStyle:
                        hintTextStyle.copyWith(color: Colors.blue),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot Password?",
                          style: keywordTextStyle.copyWith(
                              color: Color(0xffFF6B6B),
                              fontWeight: FontWeight.w900,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            print("All fields are valid");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegistrationScreen()));
                            final contact = LoginInfo(
                                email: _emailController.text,
                                password: _passwordController.text);
                            print("${_emailController.text}");
                            print("${_passwordController.text}");
                          } else {
                            print("Something wrong");
                          }
                        },
                        buttonText: 'Login',
                        myTextStyle: myTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 24,
                      ),



                      RichText(
                          text: TextSpan(
                              text: "New User? ",
                              style: keywordTextStyle.copyWith(
                                  color: Colors.blueGrey),
                              children: [
                                TextSpan(
                                    text: 'Register',
                                    style: keywordTextStyle.copyWith(
                                        color: Color(0xffFF6B6B)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => RegistrationScreen()));
                                      })
                              ]))
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),);
  }
}
