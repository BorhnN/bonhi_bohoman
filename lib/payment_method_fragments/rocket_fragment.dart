import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RcoketPayment extends StatefulWidget {
  @override
  _RcoketPaymentState createState() => _RcoketPaymentState();
}

class _RcoketPaymentState extends State<RcoketPayment> {
  final String rcoketAccountNumber = "017682124686";
  final globalKey = GlobalKey<ScaffoldState>();
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Center(
          child: Text("Donate with Rcoket"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: "রকেট নাম্বার:",
                      ),
                      TextSpan(
                        text: " " + rcoketAccountNumber.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          // color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: OutlineButton.icon(
                      onPressed: () {
                        Clipboard.setData(
                            new ClipboardData(text: rcoketAccountNumber));

                        final snackBar =
                            SnackBar(content: Text('Number copied!'));
                        globalKey.currentState.showSnackBar(snackBar);
                      },
                      icon: Icon(FontAwesomeIcons.copy),
                      label: Text(
                        "Copy",
                      ),
                      borderSide: BorderSide(color: Colors.blue),
                      textColor: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
            ),
            Text(
              "এই রকেট একাউন্টে ৫০ টাকা অথবা আপনার ইচ্ছানুযায়ী যে কোন পরিমাণ টাকা সেন্ড মানি বা ক্যাশ ইন করে ফিরতি এসএমএস থেকে ট্রানজাকশন আইডি(TxnID) নিচের বক্সে টাইপ করে সাবমিট করুন।",
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'TxnID'),
              maxLength: 10,
              controller: textController,
            ),
            RaisedButton(
              onPressed: () {
                final snackBar =
                            SnackBar(content: Text("আপনার সাহায্যের জন্য ধন্যবাদ। আপনার তথ্যটি সংরক্ষিত হয়েছে। ২৪ ঘন্টার ভিতরে আপনার প্রোফাইলে না দেখালে রিপোর্ট করুন।"));
                        globalKey.currentState.showSnackBar(snackBar);
              },
              child: Text("Submit"),
              color: Colors.blue,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
