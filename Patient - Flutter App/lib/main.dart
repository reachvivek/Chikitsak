import 'package:chikitsak/screens/Landing%20Page/landingPage.dart';
import 'package:chikitsak/screens/onBoarding/onBoarding.dart';
import 'package:chikitsak/utilities/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String uid;
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  uid = prefs.getString('uid');

  runApp(
    MyApp(
      user: uid == null ? false : true,
      uid: uid == null ? " " : uid,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({this.user, this.uid});

  final bool user;
  final String uid;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chikitsak",
      theme: ThemeData(primaryColor: uiBlue),
      home: user ? LandingHome(uid: uid) : Home(),
    );
  }
}
