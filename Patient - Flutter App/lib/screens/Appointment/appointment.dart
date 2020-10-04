import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  Appointment({this.uid});
  final String uid;
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    List<Widget> doctors = [
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
    ];

    return Scaffold(
      backgroundColor: uiBlue,
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F0F0),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: uiBlue),
        title: Text("Find Doctors",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: height(context, 20))),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFF0F0F0),
          child: Padding(
            padding: EdgeInsets.all(height(context, 14)),
            child: Column(
              children: [
                _searchBar(),
                _filter(),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(children: doctors),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _filter() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context, 26)),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => Categories());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sort_outlined, color: uiBlue, size: height(context, 20)),
            SizedBox(width: width(context, 2)),
            Text(
              "Filter",
              style: TextStyle(
                  fontSize: height(context, 18),
                  fontWeight: FontWeight.w500,
                  color: uiBlue),
            )
          ],
        ),
      ),
    );
  }

  Widget _topDoctorTile(
      String doctorCategory, String doctorName, String responseRate) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height(context, 3),
      ),
      child: Container(
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
      ),
    );
  }

  Widget _searchBar() {
    void _onPressed() {}
    String searchString = "";
    return Container(
      width: width(context, 338),
      height: height(context, 50),
      decoration: BoxDecoration(
        color: Colors.white,
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
            width: width(context, 290),
            height: height(context, 46),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.only(
                    left: width(context, 16),
                  ),
                  hintText: "Search by doctor name",
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
          // SizedBox(width: width(context, 20)),
          GestureDetector(
            onTap: () => _onPressed(),
            child: Container(
              width: width(context, 46),
              height: height(context, 46),
              decoration: BoxDecoration(
                color: uiBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    height(context, 10),
                  ),
                ),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: width(context, 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1.0,
      child: Container(
        height: height(context, 682),
        width: width(context, 336),
        alignment: Alignment.center,
        padding: EdgeInsets.all(height(context, 14)),
        decoration: BoxDecoration(
          color: Color(0xFFF0F0F0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose Doctor Type",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: height(context, 18))),
            SizedBox(height: height(context, 26)),
            Center(
              child: SizedBox(
                height: height(context, 550),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: height(context, 12),
                      spacing: width(context, 14),
                      children: [
                        BuildTile("All types"),
                        BuildTile("Allergy"),
                        BuildTile("Anesthesiology"),
                        BuildTile("Dermatology"),
                        BuildTile("Diagnostic Radiology"),
                        BuildTile("Emergency Medicine"),
                        BuildTile("Family Medicine"),
                        BuildTile("Internal Medicine"),
                        BuildTile("Medical Genetics"),
                        BuildTile("Neurology"),
                        BuildTile("Nuclear Medicine"),
                        BuildTile("Gynecology"),
                        BuildTile("Opthamlmology"),
                        BuildTile("Pathology"),
                        BuildTile("Dentistry"),
                        BuildTile("Pediatrics"),
                        BuildTile("Physical Medicine"),
                        BuildTile("Cancer"),
                        BuildTile("Orthopaedics"),
                        BuildTile("Cardiology"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: height(context, 48),
                width: width(context, 308),
                decoration: BoxDecoration(
                  color: uiBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: Alignment.center,
                child: Text("Apply Selection",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height(context, 18),
                        fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildTile extends StatefulWidget {
  final String title;

  BuildTile(this.title);
  @override
  _BuildTileState createState() => _BuildTileState();
}

class _BuildTileState extends State<BuildTile> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          this.selected = !selected;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: height(context, 0),
        ),
        child: Container(
          height: height(context, 52),
          width: width(context, 120),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              vertical: height(context, 7), horizontal: width(context, 10)),
          decoration: BoxDecoration(
              color: selected ? uiBlue : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            widget.title,
            style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: height(context, 16)),
          ),
        ),
      ),
    );
  }
}
