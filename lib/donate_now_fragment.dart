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
          // padding: EdgeInsets.all(15.0),
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () {},
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
