import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
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
          SizedBox(height: 8.0),
          RaisedButton(
            child: Text(
                "Sign in with Google",
              style: TextStyle(
                color: Colors.black12,
                fontSize: 12.0,
              ),
            ),
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
        ],
      ),
    );
  }

  void _signInWithGoogle() {
    // TODO: Auth with google
  }
}
