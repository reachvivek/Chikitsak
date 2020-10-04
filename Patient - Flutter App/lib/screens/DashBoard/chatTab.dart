import 'package:chikitsak/screens/ConnectionEnvironment/chatScreenTemplate.dart';
import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatTab extends StatefulWidget {
  ChatTab({this.uid});

  final String uid;
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  ChatTabSegnments currentChatTabSegment = ChatTabSegnments.doctor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topAppBar(),
        _buildSizedBox(20),
        _chatTabBody(context),
      ],
    );
  }

  Widget _buildSizedBox(double _height) {
    return SizedBox(height: height(context, _height));
  }

  Widget _segmentSlider() {
    final TextStyle homeScreenSegmentTextStyle =
        TextStyle(color: Colors.white, fontSize: height(context, 16));
    final homeScreenSegmentsChildren = <int, Widget>{
      ChatTabSegnments.doctor.index: SizedBox(
          height: height(context, 40),
          child: Center(
              child: Text("Doctors", style: homeScreenSegmentTextStyle))),
      ChatTabSegnments.laboratory.index: SizedBox(
          height: height(context, 40),
          child: Center(
              child: Text("Laboratories", style: homeScreenSegmentTextStyle))),
      ChatTabSegnments.pharmacy.index: SizedBox(
          height: height(context, 40),
          child: Center(
              child: Text("Pharmacy", style: homeScreenSegmentTextStyle)))
    };

    return Center(
      child: SizedBox(
        width: width(context, 303),
        child: CupertinoSlidingSegmentedControl(
            backgroundColor: Color(0x30FF8B36),
            thumbColor: Color(0xFFFF8B36),
            groupValue: currentChatTabSegment.index,
            children: homeScreenSegmentsChildren,
            onValueChanged: (index) {
              setState(() {
                if (index == ChatTabSegnments.doctor.index) {
                  currentChatTabSegment = ChatTabSegnments.doctor;
                }
                if (index == ChatTabSegnments.laboratory.index) {
                  currentChatTabSegment = ChatTabSegnments.laboratory;
                }
                if (index == ChatTabSegnments.pharmacy.index) {
                  currentChatTabSegment = ChatTabSegnments.pharmacy;
                }
              });
            }),
      ),
    );
  }

  Widget _buildChatTabContents(ChatTabSegnments currentChatTabSegment) {
    switch (currentChatTabSegment) {
      case (ChatTabSegnments.doctor):
        return _buildDoctorContainer();
        break;
      case (ChatTabSegnments.laboratory):
        return _buildLaboratoryContainer();
        break;
      case (ChatTabSegnments.pharmacy):
        return _buildPharmacyContainer();
        break;
      default:
        return _buildDoctorContainer();
    }
  }

  Widget _buildDoctorContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Doctors You have Connected",
          style: TextStyle(
            color: Colors.black,
            fontSize: height(context, 16),
          ),
          textAlign: TextAlign.left,
        ),
        _buildSizedBox(height(context, 3)),
        DoctorTile(
          "Amit Singh",
          "General Physician",
          "3 Days",
          widget.uid,
          "",
        ),
        DoctorTile(
          "Shriya Padmini",
          "General Physician",
          "1 Week",
          widget.uid,
          "",
        ),
        DoctorTile(
          "Phunsukh Wangdu",
          "General Physician",
          "3 Weeks",
          widget.uid,
          "",
        ),
      ],
    );
  }

  Widget _buildLaboratoryContainer() {
    return Container(
      width: width(context, 331),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        runSpacing: height(context, 19),
        children: [
          _laboratoryTile('assets/Rectangle 23.png', "Sims Lab", "0.5"),
          _laboratoryTile('assets/Rectangle 23 (1).png', "Chemo Lab", "0.72"),
          _laboratoryTile('assets/Rectangle 23 (2).png', "Maxwell Lab", "0.8"),
          _laboratoryTile('assets/Rectangle 23 (3).png', "Apollo Lab", "1.2"),
        ],
      ),
    );
  }

  Widget _laboratoryTile(
      String imageAssetPath, String laboratoryName, String distance) {
    return Container(
      height: height(context, 218),
      width: width(context, 156),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(height(context, 7))),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageAssetPath,
              fit: BoxFit.fill,
              height: height(context, 127),
              width: width(context, 156)),
          _buildSizedBox(height(context, 8)),
          Padding(
            padding: EdgeInsets.only(left: height(context, 8)),
            child: Text(laboratoryName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height(context, 16),
                    fontWeight: FontWeight.w500)),
          ),
          _buildSizedBox(height(context, 3)),
          Padding(
            padding: EdgeInsets.only(left: height(context, 8)),
            child: Text(distance + " kms away",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: height(context, 12),
                    fontWeight: FontWeight.w400)),
          ),
          _buildSizedBox(height(context, 12)),
          Center(
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF13D382),
                  borderRadius:
                      BorderRadius.all(Radius.circular(height(context, 2))),
                ),
                height: height(context, 26),
                width: width(context, 140),
                child: Center(
                  child: Text("Connect",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height(context, 12),
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPharmacyContainer() {
    return Container(
      width: width(context, 331),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        runSpacing: height(context, 19),
        children: [
          _laboratoryTile('assets/Rectangle 23 (1).png', "Ak Pharma", "0.72"),
          _laboratoryTile('assets/Rectangle 23 (2).png', "PES Pharmacy", "0.8"),
          _laboratoryTile('assets/Rectangle 23.png', "Medicare", "0.5"),
          _laboratoryTile('assets/Rectangle 23 (3).png', "Get Pharma", "1.2"),
        ],
      ),
    );
  }

  Widget _chatTabBody(BuildContext context) {
    List<Widget> _homeScreenWidgets = [
      _segmentSlider(),
      _buildSizedBox(24),
      _buildChatTabContents(currentChatTabSegment),
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
              top: height(context, 20),
              left: width(context, 22),
              right: width(context, 22),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _homeScreenWidgets,
              ),
            ),
          )),
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

enum ChatTabSegnments { doctor, laboratory, pharmacy }

class DoctorTile extends StatelessWidget {
  final String doctorName;
  final String doctorCategory;
  final String lastConnected;
  final String uid;
  final String imageURL;

  DoctorTile(this.doctorName, this.doctorCategory, this.lastConnected,
      this.imageURL, this.uid);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height(context, 11)),
      child: Container(
        padding: EdgeInsets.all(height(context, 14)),
        height: height(context, 99),
        width: width(context, 331),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(height(context, 7))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height(context, 71),
              width: width(context, 68),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.all(Radius.circular(height(context, 14))),
              ),
            ),
            SizedBox(width: width(context, 10)),
            Container(
              width: width(context, 193),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. " + this.doctorName,
                    style: TextStyle(
                        fontSize: height(context, 16),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: height(context, 4)),
                  Text(this.doctorCategory,
                      style: TextStyle(
                          fontSize: height(context, 16),
                          color: Colors.grey[400])),
                  SizedBox(height: height(context, 11)),
                  Text("Last Connected " + this.lastConnected + " ago",
                      style: TextStyle(
                          fontSize: height(context, 12),
                          color: Colors.grey[400])),
                ],
              ),
            ),
            GestureDetector(
              child: Image.asset(
                'assets/Vector (4).png',
                height: height(context, 30.67),
                width: width(context, 32),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreenEnvironment(
                          doctorName: this.doctorName,
                          uid: this.uid,
                          imageURL: this.imageURL))),
            )
          ],
        ),
      ),
    );
  }
}
