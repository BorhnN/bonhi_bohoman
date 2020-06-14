import 'package:bonhi_bohoman/payment_method_fragments/bkash_fragment.dart';
import 'package:bonhi_bohoman/payment_method_fragments/dbbl_fragment.dart';
import 'package:bonhi_bohoman/payment_method_fragments/rocket_fragment.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'account.dart';

class DonateNow extends StatelessWidget {
  final String campaignId;
  final double paddingBetween = 10;

  const DonateNow({@required this.campaignId});
  @override
  Widget build(BuildContext context) {
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
            getDonationBadgeFor(
              serviceName: "bKash",
              badgeAsset: "assets/img/bkash.svg",
              page: (account) => BkashPayment(account),
            ),
            Padding(
              padding: EdgeInsets.all(paddingBetween),
            ),
            getDonationBadgeFor(
              serviceName: "Rocket",
              badgeAsset: "assets/img/rocket.svg",
              color: Color(0xff85278B),
              page: (account) => RocketPayment(account),
            ),
            Padding(
              padding: EdgeInsets.all(paddingBetween),
            ),
            getDonationBadgeFor(
              serviceName: "DBBL",
              badgeAsset: "assets/img/dbbl.svg",
              page: (account) => DbblPayment(account),
            ),
            Padding(
              padding: EdgeInsets.all(paddingBetween),
            ),
            getDonationBadgeFor(
                serviceName: "Paypal",
                badgeAsset: "assets/img/paypal.svg",
                page: null)
          ],
        )),
      ),
    );
  }

  Widget getDonationBadgeFor(
      {@required String serviceName,
      @required String badgeAsset,
      @required Widget Function(Account) page,
      color = Colors.white}) {
    return FutureBuilder(
      future: FirebaseDatabase.instance
          .reference()
          .child("campaigns/$campaignId/accounts/$serviceName")
          .orderByChild("enabled")
          .equalTo(true)
          .limitToFirst(1)
          .once(),
      builder: (context, snapshot) {
        var isLoading = snapshot.data == null;
        var account;
        if (snapshot.data?.value != null) {
          var data = snapshot.data?.value?.values?.toList()[0];
          print(data);
          account = Account.fromMap(data);
        }
        return RaisedButton(
          onPressed: isLoading
              ? () {}
              : (account != null)
                  ? () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => page(account)))
                  : null,
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Opacity(
                      child: SvgPicture.asset(
                        badgeAsset,
                        height: 35.0,
                        color: account != null ? null : Colors.grey[400],
                      ),
                      opacity: isLoading ? 0 : 1,
                    ),
                    Opacity(
                      child: JumpingDotsProgressIndicator(),
                      opacity: isLoading ? 1 : 0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
