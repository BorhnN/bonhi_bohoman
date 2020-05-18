import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportIssue extends StatefulWidget {
  @override
  _ReportIssueState createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        new TextField(
          decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your first and last name',
              labelText: 'Name',
              border: OutlineInputBorder()),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
        ),
        Container(
          // height: 200,
          child: new TextField(
            maxLines: 1,
            decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your first and last name',
                labelText: 'Name',
                border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
