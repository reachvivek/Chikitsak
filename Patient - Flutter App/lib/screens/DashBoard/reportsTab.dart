import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flutter/material.dart';

class ReportTab extends StatefulWidget {
  ReportTab({this.uid});
  final String uid;
  @override
  _ReportTabState createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _topAppBar(),
      _buildSizedBox(20),
      _buildReportTabBody(),
    ]);
  }

  Widget _buildReportTabBody() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
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
              top: height(context, 24),
              left: width(context, 22),
              right: width(context, 22),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _upcomingAppointmentsCard(
                      "09 October 2020", "05:00 PM", "Sanjeev Reddy"),
                  _buildMedicalHistory(),
                  _buildFiles(),
                  _buildReports(),
                  _buildSizedBox(150),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildReports() {
    return Padding(
      padding: EdgeInsets.only(top: height(context, 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_reportsHeader(), _reportsBody()],
      ),
    );
  }

  Widget _reportsBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _reportTile("Prescription", "07 May 2020"),
        _reportTile("Prescription", "23 Sep 2020"),
        _reportTile("Prescription", "12 Jan 2020"),
        _reportTile("Prescription", "30 Mar 2020"),
      ],
    );
  }

  Widget _reportTile(String title, String date) {
    return Padding(
      padding: EdgeInsets.only(bottom: height(context, 8)),
      child: Container(
        height: height(context, 75),
        width: width(context, 330),
        padding: EdgeInsets.all(height(context, 17)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(height(context, 10)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(children: [
                Image.asset("assets/prescription 1.png",
                    height: height(context, 32)),
                SizedBox(
                  width: width(context, 19),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: height(context, 14),
                            fontWeight: FontWeight.w500)),
                    _buildSizedBox(6),
                    Text(
                      "Created on $date",
                      style: TextStyle(
                          fontSize: height(context, 11),
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ]),
            ),
            Icon(Icons.more_vert,
                color: Colors.grey[400], size: height(context, 24))
          ],
        ),
      ),
    );
  }

  Widget _reportsHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: height(context, 14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Reports",
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

  Widget _buildFiles() {
    return Padding(
      padding: EdgeInsets.only(top: height(context, 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _filesHeader(),
          _filesBody(),
        ],
      ),
    );
  }

  Widget _filesBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _filesBodyTile("Xrays", "20 Sep 2019"),
            _filesBodyTile("B&A", "29 Aug 2020"),
          ],
        ),
        _buildSizedBox(11),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _filesBodyTile("Meds", "20 Sep 2020"),
            _filesBodyTile("Insurance", "03 May 2020"),
          ],
        ),
      ],
    );
  }

  Widget _filesBodyTile(String title, String createdDate) {
    return Container(
      height: height(context, 75),
      width: width(context, 160),
      padding: EdgeInsets.symmetric(
          horizontal: width(context, 13), vertical: height(context, 13)),
      decoration: BoxDecoration(
        color: Color(0x35FFDA3C),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset("assets/folder.png",
                        height: height(context, 24)),
                    SizedBox(width: width(context, 10)),
                    Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: height(context, 14))),
                  ],
                ),
              ),
              Icon(Icons.more_vert,
                  color: Colors.grey[400], size: height(context, 24))
            ],
          ),
          // _buildSizedBox(6),
          Text(
            "Created on " + createdDate,
            style: TextStyle(
                fontSize: height(context, 11),
                color: Colors.grey[600],
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget _filesHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: height(context, 14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Files",
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

  Widget _medicalHistoryHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: height(context, 14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Medical History",
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

  Widget _medicalHistoryRow1Tile(
      String title, String imageAssetPath, String activeText) {
    return Container(
      height: height(context, 110),
      width: width(context, 160),
      padding: EdgeInsets.symmetric(
          vertical: height(context, 8), horizontal: width(context, 10)),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: width(context, 17),
            child: Image.asset(imageAssetPath, height: height(context, 25)),
          ),
          SizedBox(
            height: height(context, 4),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: height(context, 16),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: height(context, 3),
          ),
          Text(
            activeText,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: height(context, 14),
                color: uiBlue),
          )
        ],
      ),
    );
  }

  Widget _medicalHistoryRow2Tile(
    String title,
    String value,
    String imageAssetPath,
    String units,
  ) {
    return Container(
      height: height(context, 90),
      width: width(context, 160),
      padding: EdgeInsets.symmetric(
          vertical: height(context, 8), horizontal: width(context, 10)),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: width(context, 17),
                child: Image.asset(imageAssetPath, height: height(context, 20)),
              ),
              _buildSizedBox(4),
              Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: height(context, 16)))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value,
                  style: TextStyle(
                      color: uiBlue,
                      fontSize: height(context, 26),
                      fontWeight: FontWeight.w700)),
              Text(units,
                  style: TextStyle(
                      color: uiBlue,
                      fontSize: height(context, 16),
                      fontWeight: FontWeight.w400))
            ],
          )
        ],
      ),
    );
  }

  Widget _medicalHistoryBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _medicalHistoryRow1Tile(
              "Conditions",
              "assets/heart.png",
              "2 Actve Conditions",
            ),
            _medicalHistoryRow1Tile(
              "Medications",
              'assets/pills.png',
              "2 Actve Medications",
            ),
          ],
        ),
        _buildSizedBox(11),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _medicalHistoryRow2Tile(
                "Weight", "72", "assets/weight-scale 1.png", "kgs"),
            _medicalHistoryRow2Tile(
                "Height", "172", "assets/Vector (5).png", "cms"),
          ],
        )
      ],
    );
  }

  Widget _buildMedicalHistory() {
    return Padding(
      padding: EdgeInsets.only(top: height(context, 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _medicalHistoryHeader(),
          _medicalHistoryBody(),
        ],
      ),
    );
  }

  Widget _upcomingAppointmentsCard(
      String date, String time, String doctorName) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width(context, 18), vertical: height(context, 16)),
      height: height(context, 143),
      width: width(context, 331),
      decoration: BoxDecoration(
          // color: Color(0x901FA481),
          gradient: LinearGradient(
            colors: [
              Color(0xFF1FA481),
              Color(0xFF007031),
            ],
            begin: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.all(Radius.circular(height(context, 10)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height(context, 43),
            width: width(context, 46),
            decoration: BoxDecoration(
              color: Color(0xFF01BE84),
              borderRadius:
                  BorderRadius.all(Radius.circular(height(context, 7))),
            ),
            child: Icon(Icons.event_note_rounded,
                size: height(context, 30), color: Colors.white),
          ),
          SizedBox(
            width: width(context, 19),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upcoming appointments",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: height(context, 16)),
              ),
              SizedBox(height: height(context, 4)),
              Text(
                "$date",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: height(context, 25),
                    fontWeight: FontWeight.w900),
              ),
              Text(
                time,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: height(context, 18),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height(context, 17)),
              Text(
                "Dr. " + doctorName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: height(context, 18),
                    fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSizedBox(double _height) {
    return SizedBox(height: height(context, _height));
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
