import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tutorial_1/app/sign_in/sign_in_page.dart';
import 'package:flutter_tutorial_1/services/auth.dart';

import 'home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key, this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User _user;
  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  void initState() { //state on init
    super.initState();
    _updateUser(widget.auth.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: _updateUser,
      );
    }
    return HomePage(
      auth: widget.auth,
      onSignOut: () => _updateUser(null),
    );
  }
}

