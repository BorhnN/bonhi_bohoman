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
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Collected: "+data['donation_achived'].toString(),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      "2 donors",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              LinearPercentIndicator(
                animationDuration: 1000,
                animation: true,
                lineHeight: 15.0,
                percent: donationProgress,
                backgroundColor: Color(0xffDDDDDD),
                progressColor: Colors.blue,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Goal: "+data['donation_goal'].toString(),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      data['donation_expiry'].toString() + " days left",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {},
                child: const Text('Donate', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
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
