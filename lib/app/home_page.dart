import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth, @required this.onSignOut}) : super(key: key); //call back to notify Landing papge that user signed out
  final VoidCallback onSignOut;
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
