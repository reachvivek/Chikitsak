import 'package:chikitsak/screens/Appointment/appointment.dart';
import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  HomeTab({@required this.uid});
  final String uid;
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return _buildDashboardBody();
  }

  Widget _buildDashboardBody() {
    return Column(
      children: [
        _topAppBar(),
        _bannerUser(),
        _homeScreenBody(),
      ],
    );
  }

  Widget _topAppBar() {
    return Padding(
      padding: EdgeInsets.only(
        left: width(context, 22),
        top: height(context, 52),
        right: width(context, 22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _sideNavigationButton(),
          _notificationIconButton(),
        ],
      ),
    );
  }

  Widget _bannerUser() {
    return UserBanner(uid: widget.uid);
  }

  Widget _homeScreenBody() {
    List<Widget> _homeScreenWidgets = [
      _searchBar(),
      _covidBanner(),
      _findYourDoctorScroller(),
      _onGoingConsultation(),
      _topRankedDoctors(),
      _pharmaciesNearMe(),
      _bottomSizedBox()
    ];

    return Expanded(
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: uiGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                height(context, 30),
              ),
              topLeft: Radius.circular(
                height(context, 30),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: height(context, 18),
              left: width(context, 28),
              right: width(context, 28),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _homeScreenWidgets,
              ),
            ),
          )),
    );
  }

  Widget _bottomSizedBox() {
    return SizedBox(height: height(context, 50));
  }

  Widget _pharmaciesNearMe() {
    List<Widget> _children = [
      _pharmaciesNearMeHeader(),
      _pharmaciesNearMeBody()
    ];
    return Padding(
      padding: EdgeInsets.only(top: height(context, 25)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, children: _children),
    );
  }

  Widget _pharmaciesNearMeBody() {
    List<Widget> _children = [
      _pharmaciesNearMeTile("Om Pharmacy", "0.37 Kms away", " "),
      _pharmaciesNearMeTile("Aakash Pharmaceuticals", "0.58 Kms away", " "),
      _pharmaciesNearMeTile("Balaji Medicals", "1.01 kms away", " ")
    ];
    return Container(
        height: height(context, 235),
        width: width(context, 340),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _children,
        ));
  }

  Widget _pharmaciesNearMeTile(
      String pharmaName, String distance, String imageURL) {
    return Container(
      height: height(context, 68),
      width: width(context, 340),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            height(context, 10),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height(context, 11),
          horizontal: width(context, 15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height(context, 46),
              width: width(context, 48),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    height(context, 10),
                  ),
                ),
              ),
            ),
            Container(
              width: width(context, 190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    pharmaName,
                    style: TextStyle(
                        fontSize: height(context, 14),
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800]),
                  ),
                  SizedBox(height: height(context, 3)),
                  Text(
                    distance,
                    style: TextStyle(
                        fontSize: height(context, 12), color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pharmaciesNearMeHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: height(context, 14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Pharmacies Near Me",
              style: TextStyle(
                  fontSize: height(context, 18), fontWeight: FontWeight.w500)),
          Text(
            "View All",
            style: TextStyle(
              color: Color(0xFF27AE60),
              fontSize: height(context, 14),
            ),
          )
        ],
      ),
    );
  }

  Widget _topRankedDoctors() {
    List<Widget> _children = [
      _topRankedDoctorsHeader(),
      _topRankedDoctorsBody(),
    ];
    return Padding(
      padding: EdgeInsets.only(top: height(context, 25)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, children: _children),
    );
  }

  Widget _topRankedDoctorsBody() {
    List<Widget> _children = [
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
    ];
    return Container(
      height: height(context, 235),
      width: width(context, 340),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _children,
      ),
    );
  }

  Widget _topDoctorTile(
      String doctorCategory, String doctorName, String responseRate) {
    return Container(
      height: height(context, 68),
      width: width(context, 340),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            height(context, 10),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height(context, 11),
          horizontal: width(context, 15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height(context, 46),
              width: width(context, 48),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.all(Radius.circular(height(context, 10)))),
            ),
            Padding(
              padding: EdgeInsets.only(left: width(context, 14.0)),
              child: Container(
                width: width(context, 180),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctorCategory,
                      style: TextStyle(
                          fontSize: height(context, 12),
                          color: Colors.grey[400]),
                    ),
                    SizedBox(height: height(context, 3)),
                    Text(
                      "Dr. " + doctorName,
                      style: TextStyle(
                          fontSize: height(context, 14),
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800]),
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  responseRate,
                  style: TextStyle(
                    fontSize: height(context, 16),
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF27AE60),
                  ),
                ),
                Text(
                  "response rate",
                  style: TextStyle(
                      fontSize: height(context, 9), color: Colors.grey[500]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _topRankedDoctorsHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: height(context, 14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Top Ranked Doctors",
              style: TextStyle(
                  fontSize: height(context, 18), fontWeight: FontWeight.w500)),
          Text(
            "View All",
            style: TextStyle(
              color: Color(0xFF27AE60),
              fontSize: height(context, 14),
            ),
          )
        ],
      ),
    );
  }

  Widget _onGoingConsultation() {
    String _doctorCategory = "General Physician";
    String _doctorName = "Vinod Oberoi";
    String _consultationDate = "20 Aug 2020";
    String _latestRemark =
        "Decrease in temperature, coping well with medicines";

    List<Widget> _children = [
      _onGoingConsultationHeader(),
      _onGoingConsultationTile(
          _doctorCategory, _doctorName, _consultationDate, _latestRemark),
    ];
    return Padding(
      padding: EdgeInsets.only(top: height(context, 25)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, children: _children),
    );
  }

  Widget _onGoingConsultationHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: height(context, 14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Ongoing Consultation",
              style: TextStyle(
                  fontSize: height(context, 18), fontWeight: FontWeight.w500)),
          Text(
            "View History",
            style: TextStyle(
              color: Color(0xFF27AE60),
              fontSize: height(context, 14),
            ),
          )
        ],
      ),
    );
  }

  Widget _onGoingConsultationTile(String doctorCategory, String doctorName,
      String consultationDate, String latestRemark) {
    return Container(
      height: height(context, 209),
      width: width(context, 340),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(width(context, 10)))),
      child: Padding(
        padding: EdgeInsets.all(width(context, 15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height(context, 62),
                  width: width(context, 62),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.all(Radius.circular(height(context, 10))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width(context, 48)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctorCategory,
                          style: TextStyle(
                              fontSize: height(context, 14),
                              color: Colors.grey[400])),
                      Text(
                        "Dr. " + doctorName,
                        style: TextStyle(
                            fontSize: height(context, 20),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/Vector (4).png',
                    height: height(context, 30.67),
                    width: width(context, 32),
                  ),
                )
              ],
            ),
            SizedBox(height: height(context, 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Consultation Date",
                        style: TextStyle(
                          fontSize: height(context, 10),
                          color: Colors.grey[400],
                        )),
                    Text(
                      consultationDate,
                      style: TextStyle(
                        fontSize: height(context, 16),
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                    )
                  ],
                ),
                Text(
                  "View Prescription",
                  style: TextStyle(
                      fontSize: height(context, 14), color: Color(0xFF00B6BD)),
                )
              ],
            ),
            SizedBox(height: height(context, 18)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Latest Remark",
                  style: TextStyle(
                    fontSize: height(context, 10),
                    color: Colors.grey[400],
                  ),
                ),
                Text(
                  latestRemark,
                  style: TextStyle(
                    fontSize: height(context, 16),
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _findYourDoctorScroller() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _doctorScrollerHeader(),
        SizedBox(
          height: height(context, 14),
        ),
        _doctorScrollerBody()
      ],
    );
  }

  Widget _doctorScrollerBody() {
    //List values would be coming from API
    List<String> imageUrl = [
      'assets/Vector (1).png',
      'assets/Vector (2).png',
      'assets/Vector (3).png'
    ];

    List<String> name = ['General', 'Dental Care', 'Eye Care'];

    List<Color> background = [
      Color(0xFF13D382),
      Color(0xFFFF8B36),
      Color(0xFF3CB9FF),
    ];

    List<String> noOfDoctors = ["48", "13", "9"];

    List<Widget> _children = [];

    for (int i = 0; i < name.length; i++) {
      _children
          .add(_cardModel(imageUrl[i], name[i], background[i], noOfDoctors[i]));
    }

    return SizedBox(
      height: height(context, 134),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: _children,
        ),
      ),
    );
  }

  Widget _cardModel(
      String imageURL, String name, Color background, String noOfDoctors) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width(context, 6),
      ),
      child: Container(
        height: height(context, 130),
        width: width(context, 117),
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.all(
            Radius.circular(
              height(context, 10),
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: height(context, 80),
              width: width(context, 117),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    height(context, 10),
                  ),
                  topRight: Radius.circular(
                    height(context, 10),
                  ),
                ),
              ),
              child: Center(
                child: Image.asset(
                  '$imageURL',
                  height: height(context, 52),
                  width: width(context, 48.3),
                ),
              ),
            ),
            Container(
              height: height(context, 50),
              width: width(context, 117),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height(context, 14),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height(context, 2),
                  ),
                  Text(
                    "$noOfDoctors Doctors",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: height(context, 11),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _doctorScrollerHeader() {
    void _onTap() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Appointment(uid: widget.uid)));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Find Your Desired Doctor",
          style: TextStyle(
              color: Colors.black,
              fontSize: height(context, 18),
              fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: () => _onTap(),
          child: Text(
            "View All",
            style: TextStyle(
              color: Color(0xFF27AE60),
              fontSize: height(context, 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _covidBanner() {
    return Padding(
      padding: EdgeInsets.only(
        top: height(context, 15),
        bottom: height(context, 27),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height(context, 90),
            width: width(context, 155),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  height(context, 10),
                ),
              ),
            ),
            child: Image.asset('assets/COVID (2).png', fit: BoxFit.fill),
          ),
          Container(
            height: height(context, 90),
            width: width(context, 155),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  height(context, 10),
                ),
              ),
            ),
            child: Image.asset('assets/Book Test (2).png', fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    void _onPressed() {}
    String searchString = "";
    return Container(
      width: width(context, 314),
      height: height(context, 44),
      decoration: BoxDecoration(
        color: Color(0xFFDFDFDF),
        borderRadius: BorderRadius.all(
          Radius.circular(
            height(context, 10),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width(context, 234),
            height: height(context, 44),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.only(
                    left: width(context, 16),
                  ),
                  hintText: "Search Doctors, medicines...",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  searchString = value;
                },
                onSubmitted: (value) {
                  print(searchString);
                },
              ),
            ),
          ),
          SizedBox(width: width(context, 25)),
          GestureDetector(
            onTap: () => _onPressed(),
            child: Container(
              width: width(context, 55),
              height: height(context, 44),
              decoration: BoxDecoration(
                color: uiRed,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    height(context, 10),
                  ),
                ),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: width(context, 22),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _sideNavigationButton() {
    void _onTap() {}

    return GestureDetector(
      onTap: () => _onTap(),
      child: Image.asset(
        'assets/Vector.png',
        height: height(context, 18.67),
        width: width(context, 22),
      ),
    );
  }

  Widget _notificationIconButton() {
    void _onPressed() {}
    return GestureDetector(
      child: Icon(
        Icons.notifications,
        color: Colors.white,
        size: width(context, 22),
      ),
      onTap: () => _onPressed(),
    );
  }
}

class UserBanner extends StatelessWidget {
  final String uid;
  UserBanner({this.uid});
  @override
  Widget build(BuildContext context) {
    String name;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(uid).snapshots(),
        builder: (context, snapshot) {
          name = snapshot.data.documents[0]['Name'] ?? " ";

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width(context, 48),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Doctors-pana 1.png',
                  height: height(context, 111),
                  width: width(context, 72),
                ),
                SizedBox(
                  width: width(context, 17),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi $name!",
                        style: TextStyle(
                            fontSize: height(context, 20),
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height(context, 7),
                      ),
                      Text(
                        "Book Your appointment with",
                        style: TextStyle(
                          fontSize: height(context, 14),
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "the right doctor",
                        style: TextStyle(
                          fontSize: height(context, 14),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
