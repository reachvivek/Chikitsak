import 'package:chikitsak/utilities/functions.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  final String uid;

  ProfileTab({this.uid});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: InkWell(
            onTap: () {
              signOut(context);
            },
            child: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: Colors.white,
              ),
              child: Center(
                child: Text("Logout"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
