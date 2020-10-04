import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import "package:flutter/material.dart";

class ChatScreenEnvironment extends StatefulWidget {
  final String doctorName;
  final String imageURL;
  final String uid;

  ChatScreenEnvironment({this.doctorName, this.imageURL, this.uid});
  @override
  _ChatScreenEnvironmentState createState() => _ChatScreenEnvironmentState();
}

class _ChatScreenEnvironmentState extends State<ChatScreenEnvironment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFF7F7F7),
      body: Column(
        children: [
          _buildAppBar(),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - height(context, 111),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: height(context, 29),
        left: 0,
        right: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context, 12)),
          child: SingleChildScrollView(
            child: Container(
              width: width(context, 350),
              height: height(context, 52),
              padding: EdgeInsets.symmetric(
                horizontal: width(context, 12),
                vertical: height(context, 16),
              ),
              decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  Icon(Icons.emoji_emotions_outlined,
                      size: height(context, 24), color: Colors.grey[400]),
                  SizedBox(width: width(context, 13)),
                  Icon(Icons.link_outlined,
                      size: height(context, 24), color: Colors.grey[400]),
                  SizedBox(width: width(context, 6)),
                  Container(
                      height: height(context, 24),
                      width: width(context, 1),
                      color: Colors.grey[400]),
                  SizedBox(width: width(context, 7)),
                  Container(
                      width: width(context, 195),
                      child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type Your Message... ",
                            hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w400,
                                fontSize: height(context, 16)),
                          ))),
                  Icon(Icons.camera_alt,
                      size: height(context, 24), color: Colors.grey[400]),
                  SizedBox(width: width(context, 13)),
                  Icon(Icons.mic,
                      size: height(context, 24), color: Colors.grey[400]),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: Container(
        height: height(context, 77),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: width(context, 16),
          vertical: height(context, 17),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back,
                        color: uiBlue, size: height(context, 25)),
                  ),
                  SizedBox(width: width(context, 22)),
                  Container(
                    height: height(context, 47),
                    width: width(context, 47),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  SizedBox(width: width(context, 11)),
                  Text("Dr." + widget.doctorName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height(context, 20),
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Container(
                child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0XFF13D382),
                  radius: width(context, 20),
                  child: Icon(Icons.phone,
                      color: Colors.white, size: height(context, 18)),
                ),
                SizedBox(width: width(context, 14.38)),
                CircleAvatar(
                  backgroundColor: Color(0XFF13D382),
                  radius: width(context, 20),
                  child: Icon(Icons.video_call_rounded,
                      color: Colors.white, size: height(context, 18)),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
