import 'package:bonhi_bohoman/donate_now_fragment.dart';
import 'package:bonhi_bohoman/donor.dart';
import 'package:bonhi_bohoman/donors_fragment.dart';
import 'package:bonhi_bohoman/payment_method_fragments/bkash_fragment.dart';
import 'package:bonhi_bohoman/recipeints_fragment.dart';
import 'package:bonhi_bohoman/recipient.dart';
import 'package:bonhi_bohoman/report_issue.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bonhi_bohoman/LoginScreen.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bohni Bohoman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'বহ্নি বহমান',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0;
  List<Recipient> recipientList = List();
  List<Donor> donarList = List();

  void _incrementCounter() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((onValue) {
      FirebaseAuth.instance.currentUser().then(
        (currentUser) {
          if (currentUser == null) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()));
          }
        },
      );
    });
    FirebaseDatabase.instance
        .reference()
        .child("recipients")
        .once()
        .then((DataSnapshot onValue) {
      Map<dynamic, dynamic> recipients = onValue.value;
      recipientList.clear();
      // donarList = recipients as List<Doner>;
      print(donarList.length);
      recipients.forEach((key, value) {
        Recipient recipient = new Recipient.fromMap(value);
        recipientList.add(recipient);
        donarList.add(new Donor.fromMap(value));
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
        )),
      ),
      body: getbody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.handHoldingHeart),
            title: Text('Donors'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.handshake),
            title: Text('Recipients'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bug),
            title: Text("Report Issue"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getbody() {
    switch (_selectedIndex) {
      case 0:
        return Home();
      case 1:
        return DonorsFragment(donarList);
      case 2:
        return RecipientsFragment(recipientList);
      case 3:
        return ReportIssue();
      default:
        return Home();
    }
  }
}
