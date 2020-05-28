import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportIssue extends StatefulWidget {
  @override
  _ReportIssueState createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  String issueType = 'Donation not listed';
  String paymentMethod;
  DatabaseReference reportDBRef = FirebaseDatabase.instance.reference().child('campaigns/sust/months/202001/tickets');

  final contactNumberText = TextEditingController();
  final amountText = TextEditingController();
  final receiverACText = TextEditingController();
  final senderACText = TextEditingController();
  final timeText = TextEditingController();
  final trxIDText = TextEditingController();
  final moreText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: getChildrenList(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print("object");
  }

  List<Widget> getChildrenList() {
    var list = List<Widget>();
    list.addAll([
      Row(
        children: <Widget>[
          Text(
            "Issue type:  ",
          ),
          DropdownButton(
            value: issueType,
            items: <String>['Donation not listed', 'Other']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                issueType = newValue;
              });
            },
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
      ),
    ]);

    list.addAll(buildReportBody(issueType));
    return list;
  }

  List<Widget> buildReportBody(String selected) {
    if (selected == 'Donation not listed') {
      return [
        TextField(
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: 'Enter your contact number',
            labelText: 'Contact number',
          ),
        ),
        Row(
          children: <Widget>[
            Text(
              "Payment method:  ",
            ),
            DropdownButton(
              value: paymentMethod,
              hint: Text("Select one"),
              style: TextStyle(color: Colors.blue, fontSize: 18),
              items: <String>['Bkash', 'Rocket', 'DBBL']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  paymentMethod = newValue;
                });
              },
            ),
          ],
        ),
        TextField(
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: 'Enter the amount',
            labelText: 'Amount',
          ),
        ),
        TextField(
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: 'Enter the number',
            labelText: 'Receiver A\\C no.',
          ),
        ),
        TextField(
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: 'Enter the number',
            labelText: 'Sender A\\C no. (optional)',
          ),
        ),
        TextField(
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: 'Enter the time',
            labelText: 'When did you send (optional)',
          ),
        ),
        TextField(
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: 'Enter the ID',
            labelText: 'Transaction ID (optional)',
          ),
        ),
        TextField(
          maxLines: 2,
          decoration: const InputDecoration(
            labelText: 'Additional info (optional)',
          ),
        ),
        RaisedButton(
          onPressed: () {
            reportDBRef.push().set(<String, String>{
        
      });
            final snackBar =
                SnackBar(content: Text("আপনার রিপোর্টটি সংরক্ষিত হয়েছে।"));
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Text("Submit"),
          color: Colors.blue,
          textColor: Colors.white,
        )
      ];
    }
    return [
      TextField(
        maxLines: 1,
        decoration: const InputDecoration(
          hintText: 'Enter your contact number',
          labelText: 'Contact number',
        ),
      ),
      TextField(
        maxLines: 3,
        decoration: const InputDecoration(
          labelText: 'Message',
        ),
      ),
      RaisedButton(
        onPressed: () {
          final snackBar =
              SnackBar(content: Text("আপনার রিপোর্টটি সংরক্ষিত হয়েছে।"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text("Submit"),
        color: Colors.blue,
        textColor: Colors.white,
      )
    ];
  }
}
