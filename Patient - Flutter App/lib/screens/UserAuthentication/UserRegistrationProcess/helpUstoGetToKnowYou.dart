import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/functions.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpUsKnowYouBetter extends StatefulWidget {
  final String uid;

  HelpUsKnowYouBetter({@required this.uid});

  @override
  _HelpUsKnowYouBetterState createState() => _HelpUsKnowYouBetterState();
}

class _HelpUsKnowYouBetterState extends State<HelpUsKnowYouBetter> {
  String age;
  String weight;
  String _height;
  String medications;
  String allergies;
  Gender currentGender = Gender.male;
  String mobile;
  String name;
  @override
  Widget build(BuildContext context) {
    final homeScreenSegmentsChildren = <int, Widget>{
      Gender.male.index: SizedBox(
          height: height(context, 42),
          child: Center(
              child: Text(
            "Male",
          ))),
      Gender.female.index: SizedBox(
          height: height(context, 42),
          child: Center(
              child: Text(
            "Female",
          ))),
    };
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width(context, 33)),
          child: Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Help us know you better",
                    style: TextStyle(
                        color: uiBlue,
                        fontSize: height(context, 24),
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: height(context, 38)),
                  Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Your Full Name",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: height(context, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: height(context, 26)),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    onChanged: (value) {
                      mobile = value;
                    },
                    decoration: InputDecoration(
                      hintText: "9876453210",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: height(context, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: height(context, 26)),
                  Text(
                    "Age",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    onChanged: (value) {
                      age = value;
                    },
                    decoration: InputDecoration(
                      hintText: "18",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: height(context, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: height(context, 26)),
                  SizedBox(
                    width: width(context, 180),
                    child: CupertinoSlidingSegmentedControl(
                        backgroundColor: Colors.grey[100],
                        thumbColor: uiBlue,
                        groupValue: currentGender.index,
                        children: homeScreenSegmentsChildren,
                        onValueChanged: (index) {
                          setState(() {
                            if (index == Gender.male.index) {
                              currentGender = Gender.male;
                            }
                            if (index == Gender.female.index) {
                              currentGender = Gender.female;
                            }
                          });
                        }),
                  ),
                  SizedBox(height: height(context, 26)),
                  Text(
                    "Weight (in kgs)",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    onChanged: (value) {
                      weight = value;
                    },
                    decoration: InputDecoration(
                      hintText: "65",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: height(context, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: height(context, 26)),
                  Text(
                    "Height (in cms)",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    onChanged: (value) {
                      _height = value;
                    },
                    decoration: InputDecoration(
                      hintText: "172",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: height(context, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: height(context, 26)),
                  Text(
                    "Current Medication (if any)",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    onChanged: (value) {
                      medications = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Xanax, ChloroPhenol 500 mg etc.",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: height(context, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: height(context, 26)),
                  Text(
                    "Allergies",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height(context, 12),
                        fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    onChanged: (value) {
                      allergies = value;
                    },
                    decoration: InputDecoration(
                      hintText: "PineApple, tricaptenol",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: height(context, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: height(context, 26)),
                  InkWell(
                    onTap: () async {
                      if (age != null &&
                          weight != null &&
                          _height != null &&
                          mobile != null &&
                          name != null)
                        await getStarted(
                          context,
                          age,
                          currentGender.index,
                          weight,
                          _height,
                          medications.toString(),
                          allergies.toString(),
                          widget.uid,
                          mobile,
                          name,
                        );
                      else
                        Flushbar(
                          message: "Please Fill the Details before submission",
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
                      child: Text("Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height(context, 20),
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum Gender { male, female }
