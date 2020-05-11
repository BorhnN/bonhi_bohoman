import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          FirebaseDatabase.instance.reference().child("campaigns/sust").once(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data.value;
          double donationProgress =
              (data['donation_achived'] / data['donation_goal'])
                  .clamp(0.0, 1.0);

          return ListView(
            children: <Widget>[
              LinearPercentIndicator(
                animationDuration: 700,
                lineHeight: 14.0,
                percent: donationProgress,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
              Text(data['campaign_description']),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
