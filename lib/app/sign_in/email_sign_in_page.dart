import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1/app/sign_in/email_sign_in_form.dart';
import 'package:flutter_tutorial_1/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({@required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time tracker"),
        elevation: 10.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
            child: EmailSignInForm(
              auth: auth,
            ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}

Widget _buildContent() {
  return Container();
}
