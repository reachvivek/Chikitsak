import 'package:chikitsak/utilities/functions.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:chikitsak/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: buildLoginScreenBody(context),
        ),
      ),
    );
  }

  Widget buildLoginScreenBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width(context, 30), vertical: height(context, 30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/Insurance-amico 1.png",
              height: height(context, 156), width: width(context, 156)),
          SizedBox(height: height(context, 11)),
          Text(
            "Welcome back to the club!",
            style: TextStyle(
                color: uiBlue,
                fontSize: height(context, 26),
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: height(context, 3)),
          Text("Login to continue using our services",
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
          InkWell(
            onTap: () async {
              if (email != null && password != null)
                await signin(context, email, password);
              else
                Flushbar(
                  message: "Please enter email and password",
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
              child: Text("Log In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: height(context, 20),
                      fontWeight: FontWeight.w500)),
            ),
          ),
          SizedBox(height: height(context, 20)),
          InkWell(
            onTap: () async {
              await signInWithGoogle(context);
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
                "Don't have an account?",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: height(context, 12),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(width: width(context, 4)),
              InkWell(
                onTap: () => signup(context),
                child: Text(
                  "Sign Up",
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
    );
  }
}
