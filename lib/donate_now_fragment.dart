import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonateNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Donate Now"),
        ),
      ),
      body: Container(
          child: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.paypal,
              size: 18,
            ),
            label: Text('bKash', style: TextStyle(fontSize: 18)),
          ),
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.paypal,
              size: 18,
            ),
            label: Text('Rocket', style: TextStyle(fontSize: 18)),
          ),
          // RaisedButton.icon(
          //   onPressed: () {},
          //   icon: Icon(SvgPicture.asset(assetName)),
          //   label: Text('DBBL', style: TextStyle(fontSize: 18)),
          // ),

          new SvgPicture.asset('assets/bkash.svg'),
          RaisedButton(
            onPressed: () {},
            child: Icon(
              FontAwesomeIcons.paypal,
              size: 18,
            ),
          ),
        ],
      )),
    );
  }
}
