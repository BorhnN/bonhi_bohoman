import 'package:bonhi_bohoman/payment_method_fragments/bkash_fragment.dart';
import 'package:bonhi_bohoman/payment_method_fragments/dbbl_fragment.dart';
import 'package:bonhi_bohoman/payment_method_fragments/rocket_fragment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonateNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double buttonHeight = 35.0;
    final double paddingBetween = 10;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Donate Now"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BkashPayment()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/img/bkash.svg",
                      height: buttonHeight,
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.all(paddingBetween),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RcoketPayment()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/img/rocket.svg",
                      height: buttonHeight,
                    ),
                  ],
                ),
              ),
              color: Color(0xff85278B),
            ),
            Padding(
              padding: EdgeInsets.all(paddingBetween),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DbblPayment()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/img/dbbl.svg",
                      height: buttonHeight,
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.all(paddingBetween),
            ),
            RaisedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/img/paypal.svg",
                      height: buttonHeight,
                    ),
                  ],
                ),
              ),
              color: Color(0xffF8BF37),
            ),
          ],
        )),
      ),
    );
  }
}
