import 'package:chikitsak/screens/UserAuthentication/UserRegistrationProcess/helpUstoGetToKnowYou.dart';
import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/functions.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    bool _isHidden = true;

    void _toggleVisibility() {
      setState(() {
        _isHidden = !_isHidden;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height(context, 20), horizontal: width(context, 30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/Doctors-cuate 1.png",
                  height: height(context, 156), width: width(context, 156)),
              SizedBox(height: height(context, 11)),
              Text(
                "Welcome to the club!",
                style: TextStyle(
                    color: uiBlue,
                    fontSize: height(context, 26),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: height(context, 3)),
              Text("Sign up and enjoy our services for free",
                  style: TextStyle(
                      color: uiBlue,
                      fontSize: height(context, 14),
                      fontWeight: FontWeight.w400)),
              SizedBox(height: height(context, 39)),
              Text(
                "Email",
                style: TextStyle(
                    color: uiBlue,
                    fontSize: height(context, 12),
                    fontWeight: FontWeight.w500),
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: "hernandez@chikitsak.com",
                  hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: height(context, 14),
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: height(context, 26)),
              Text(
                "Password",
                style: TextStyle(
                    color: uiBlue,
                    fontSize: height(context, 12),
                    fontWeight: FontWeight.w500),
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: _isHidden,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: height(context, 14),
                      fontWeight: FontWeight.w400),
                  suffixIcon: IconButton(
                      iconSize: height(context, 16),
                      color: uiBlue,
                      icon: _isHidden
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: _toggleVisibility),
                ),
              ),
              SizedBox(height: height(context, 44)),
              Row(
                children: [
                  Text(
                    "By Signing in you agree to our ",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Terms and Conditions ",
                    style: TextStyle(
                        color: uiBlue,
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "&",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: height(context, 3)),
              Text(
                "Privacy Policy",
                style: TextStyle(
                    color: uiBlue,
                    fontSize: height(context, 12),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: height(context, 16)),
              InkWell(
                onTap: () async {
                  if (email != null && password != null) {
                    if (!EmailValidator.validate(email)) {
                      Flushbar(
                        message: "Invalid Email Address",
                        duration: Duration(milliseconds: 2000),
                      )..show(context);
                    } else
                      await signUp(
                        context,
                        email,
                        password,
                      );
                  } else
                    Flushbar(
                      message: "Please fill the details before Signing Up",
                      duration: Duration(milliseconds: 2000),
                    )..show(context);
                },
                child: Container(
                  height: height(context, 52),
                  width: width(context, 331),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: uiBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text("Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height(context, 20),
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(height: height(context, 16)),
              InkWell(
                onTap: () async {
                  await signUpWithGoogle(context);
                },
                child: Container(
                  height: height(context, 52),
                  width: width(context, 331),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text("Google",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height(context, 20),
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(height: height(context, 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: width(context, 4)),
                  InkWell(
                    onTap: () => login(context),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: uiBlue,
                          fontSize: height(context, 12),
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
