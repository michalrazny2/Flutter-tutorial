import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1/common_widgets/custom_raised_button.dart';
import 'package:flutter_tutorial_1/common_widgets/sign_in_button.dart';
import 'package:flutter_tutorial_1/common_widgets/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {

  Future<void> _signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      print('${userCredentials.user.uid}');
    } catch (e) {
      print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time tracker"),
        elevation: 10.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() { // '_' before name says "private"
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40.0),
          SocialSignInButton(
            assetName: "images/images/google-logo.png",
            text: "Sign in with Google",
            textColor: Colors.black,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: "images/images/facebook-logo.png",
            text: "Sign in with Facebook",
            textColor: Colors.white,
            color: Color(0xFF334092),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Sign in with email",
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          Text(
            "or",
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Go anonymous",
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }

  void _signInWithGoogle() {
    // TODO: Auth with google
  }
}
