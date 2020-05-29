import 'package:bonhi_bohoman/donate_now_fragment.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:skeleton_text/skeleton_text.dart';

class Home extends StatefulWidget {
  final String campaignId;

  const Home({@required this.campaignId});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseDatabase.instance
            .reference()
            .child("campaigns/${widget.campaignId}/months/202001/details")
            .once(),
        builder: (context, snapshot) {
          var data;
          double donationProgress = 0.0;
          if (snapshot.hasData) {
            data = snapshot.data.value;
            donationProgress = (data['raised'] / data['goal']).clamp(0.0, 1.0);
          }
          return ListView(
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  data != null
                      ? RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                text: data['raised'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              TextSpan(
                                text: " ৳",
                              ),
                              TextSpan(
                                text: "\nraised",
                              ),
                            ],
                          ),
                        )
                      : SkeletonAnimation(
                          child: Container(
                            width: 60,
                            height: 32,
                            decoration: BoxDecoration(color: Colors.grey[300]),
                          ),
                        ),
                  data != null
                      ? RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black87),
                              children: [
                                TextSpan(
                                  text: data['donorCount'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                TextSpan(
                                  text: "\ndonors",
                                ),
                              ]),
                        )
                      : SkeletonAnimation(
                          child: Container(
                            width: 60,
                            height: 32,
                            decoration: BoxDecoration(color: Colors.grey[300]),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  data != null
                      ? RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                text: (donationProgress * 100)
                                        .toStringAsFixed(1) +
                                    "% of goal\n",
                              ),
                              TextSpan(
                                text: data['goal'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              TextSpan(
                                text: " ৳",
                              ),
                            ],
                          ),
                        )
                      : SkeletonAnimation(
                          child: Container(
                            width: 60,
                            height: 32,
                            decoration: BoxDecoration(color: Colors.grey[300]),
                          ),
                        ),
                  data != null
                      ? RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black87),
                              children: [
                                TextSpan(
                                  text: (31 - DateTime.now().day).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                TextSpan(
                                  text: "\ndays left",
                                ),
                              ]),
                        )
                      : SkeletonAnimation(
                          child: Container(
                            width: 60,
                            height: 32,
                            decoration: BoxDecoration(color: Colors.grey[300]),
                          ),
                        ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DonateNow()));
                },
                child: const Text('Donate', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("campaigns/${widget.campaignId}/details")
                    .once(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.value['campaign_description']);
                  } else {
                    return SkeletonAnimation(
                      child: Column(children: [
                        Row(children: [
                          Expanded(
                            child: Container(
                              height: 22,
                              decoration:
                                  BoxDecoration(color: Colors.grey[300]),
                            ),
                          )
                        ]),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                        ),
                        Row(children: [
                          Expanded(
                            child: Container(
                              height: 22,
                              decoration:
                                  BoxDecoration(color: Colors.grey[300]),
                            ),
                          )
                        ]),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                        ),
                        Row(children: [
                          Expanded(
                            child: Container(
                              height: 22,
                              decoration:
                                  BoxDecoration(color: Colors.grey[300]),
                            ),
                          )
                        ]),
                      ]),
                    );
                  }
                },
              ),
            ],
          );
        });
  }
}
