import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/functions.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int currentPage = 1;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      PageViewTile(
          header: "Your home for health",
          content:
              "Chikitsak is the trusted and familiar home where they know they'll find a healing touch"),
      PageViewTile(
          header: "Doctor's appointment in seconds",
          content: "Find the right doctor based on response rate and lot more"),
      PageViewTile(
          header: "Chat with a Doctor",
          content:
              "Can't find time to go to the clinic? Chat with your doctor online at any time of the day"),
      PageViewTile(
          header: "Health History in your pocket",
          content:
              "Upload prescriptions,medical reports etc. to keep them safe and available at any point of time"),
    ];
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width(context, 14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      pageController.jumpToPage(3);
                    },
                    child: Text("Skip",
                        style: TextStyle(
                            color: uiBlue,
                            fontSize: height(context, 18),
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
              SizedBox(height: height(context, 21)),
              Container(
                height: height(context, 255),
                width: width(context, 333),
                alignment: Alignment.bottomLeft,
                child: PageView(
                  pageSnapping: true,
                  children: pages,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index + 1;
                    });
                  },
                ),
              ),
              SizedBox(height: height(context, 20)),
              Padding(
                padding: EdgeInsets.only(left: width(context, 13)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 4,
                      effect: WormEffect(
                          dotHeight: height(context, 7),
                          dotWidth: width(context, 7),
                          activeDotColor: uiBlue,
                          spacing: width(context, 4),
                          dotColor: Color(0xFFDADADA)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height(context, 86)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height: height(context, 180),
                        width: width(context, 178),
                        child: currentPage == 1
                            ? Image.asset(
                                "assets/undraw_Home_settings_re_pkya 1.png")
                            : currentPage == 2
                                ? Image.asset(
                                    "assets/undraw_medicine_b1ol 1.png")
                                : currentPage == 3
                                    ? Image.asset(
                                        "assets/undraw_online_messaging_9ro6 1.png")
                                    : currentPage == 4
                                        ? Image.asset(
                                            "assets/undraw_Done_checking_re_6vyx 1.png")
                                        : Text(" "))
                  ],
                ),
              ),
              SizedBox(height: height(context, 31)),
              InkWell(
                onTap: () => signup(context),
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
              SizedBox(height: height(context, 8)),
              InkWell(
                onTap: () => login(context),
                child: Container(
                  height: height(context, 52),
                  width: width(context, 331),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text("Log In",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height(context, 20),
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(height: height(context, 46)),
            ],
          ),
        )),
      ),
    );
  }
}

class PageViewTile extends StatelessWidget {
  final String header;
  final String content;

  PageViewTile({this.header, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(
              color: uiBlue,
              fontSize: height(context, 52),
              fontWeight: FontWeight.w900),
        ),
        SizedBox(height: height(context, 15)),
        Text(
          content,
          style: TextStyle(
              color: uiBlue,
              fontSize: height(context, 14),
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
