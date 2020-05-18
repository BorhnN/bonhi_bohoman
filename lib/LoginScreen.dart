import 'package:bonhi_bohoman/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var nameEditingController = TextEditingController();
  var globalKey = GlobalKey();
  DatabaseReference userRef;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Spacer(flex: 3),
            Text(
              "বহ্নি বহমান",
              style: Theme.of(context).textTheme.display2,
            ),
            Spacer(flex: 4),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Please, sign in to continue:",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                GoogleSignInButton(
                  onPressed: () {
                    _handleSignIn();
                  },
                  darkMode: true, // default: false
                ),
              ],
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  void _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print(user.uid);
    userRef = FirebaseDatabase.instance.reference().child("users/${user.uid}");
    onSuccessfulLogin();
  }

  void onSuccessfulLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MyApp()));
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    super.dispose();
  }

  void submitName() {
    print("submit is pressed");
    FormState state = globalKey.currentState;
    if (state.validate()) {
      var signUpData = Map<String, dynamic>();
      signUpData['name'] = nameEditingController.text;
      signUpData['signuptime'] = ServerValue.timestamp;
      signUpData['currenttime'] = ServerValue.timestamp;
      userRef?.set(signUpData)?.whenComplete(() {
        Navigator.of(context, rootNavigator: true).pop();
        onSuccessfulLogin();
      })?.catchError((error) {
        print("Aight imma head out");
        _auth.signOut();
      });
    }
  }
}
