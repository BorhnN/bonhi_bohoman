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
      future: FirebaseDatabase.instance
          .reference()
          .child("campaigns/sust/details")
          .once(),
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
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black87),
                              children: [
                            TextSpan(
                              text: data['donation_achived'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextSpan(
                              text: " ৳",
                            ),
                            TextSpan(
                              text: "\nraised",
                            ),
                          ]))),
                  Expanded(
                    flex: 5,
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                          style: TextStyle(color: Colors.black87),
                          children: [
                            TextSpan(
                              text: "4",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextSpan(
                              text: "\ndonors",
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              LinearPercentIndicator(
                animationDuration: 1000,
                animation: true,
                lineHeight: 15.0,
                percent: donationProgress,
                backgroundColor: Color(0xffDDDDDD),
                progressColor: Colors.blue,
                // padding: EdgeInsets.all(15),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black87),
                              children: [
                            TextSpan(
                              text:
                                  (donationProgress * 100).toStringAsFixed(1) +
                                      "% of goal\n",
                            ),
                            TextSpan(
                              text: data['donation_goal'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextSpan(
                              text: " ৳",
                            ),
                          ]))),
                  Expanded(
                    flex: 5,
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                          style: TextStyle(color: Colors.black87),
                          children: [
                            TextSpan(
                              text:
                                  (data['donation_expiry'] - DateTime.now().day)
                                      .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextSpan(
                              text: "\ndays left",
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              RaisedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the Scaffold in the widget tree and use
                  // it to show a SnackBar.
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: const Text('Donate', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
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
