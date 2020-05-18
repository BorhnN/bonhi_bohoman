import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DbblPayment extends StatefulWidget {
  @override
  _DbblPaymentState createState() => _DbblPaymentState();
}

class _DbblPaymentState extends State<DbblPayment> {
  final String dbblAccountNumber = "7017016091638";
  final String dbblAccountName = "MD Shaleh Islam Tonmoy";
  final globalKey = GlobalKey<ScaffoldState>();
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Center(
          child: Text("Donate with Dbbl"),
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
                        text: "DBBL A\\C Name:",
                      ),
                      TextSpan(
                        text: " " + dbblAccountName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 16,
                          // color: Colors.green,
                        ),
                      ),
                      TextSpan(
                        text: "\nDBBL A\\C Number:",
                      ),
                      TextSpan(
                        text: " " + dbblAccountNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 18,
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
                            new ClipboardData(text: dbblAccountNumber));

                        final snackBar =
                            SnackBar(content: Text('A\\C Number copied!'));
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
              "এই DBBL একাউন্টে ৫০ টাকা অথবা আপনার ইচ্ছানুযায়ী যে কোন পরিমাণ টাকা পাঠিয়ে আপনার এমাউন্টটি নিচের বক্সে টাইপ করে সাবমিট করুন।",
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Amount'),
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
