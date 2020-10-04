import 'package:cloud_firestore/cloud_firestore.dart';

class Backend {
  final String uid;

  Backend({this.uid});

//set User Data to Collection "uid"

  Future setUserData(
          {String age,
          String mobile,
          String gender,
          String weight,
          String height,
          String currentMedications,
          String allergies,
          String name}) async =>
      await FirebaseFirestore.instance.collection(uid).doc('User Data').set({
        "Age": age,
        "Phone Number": mobile,
        "Gender": gender,
        "Weight": weight,
        "Height": height,
        "Current Medications": currentMedications,
        "Allergies": allergies,
        "Name": name,
      });
}
