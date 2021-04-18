import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1/common_widgets/form_submit_button.dart';
import 'package:flutter_tutorial_1/common_widgets/show_alert_dialog.dart';
import 'package:flutter_tutorial_1/services/auth.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({@required this.auth});
  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();

}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController(); // controllers should be used in StatefulWidget to work properly
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _submit() async {
    try{
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        print("email: $_email, password: $_password");
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch(e) {
      showAlertDialog(
          context,
          title: "Sign in failed",
          content: e.toString(),
          defaultActionText: "OK",
      );
    }

  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn ?
          EmailSignInFormType.register : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn ?
        "Sign in" : "Create an account";
    final secondaryText = _formType == EmailSignInFormType.signIn ?
        "Need an account? Register" : "Have an account? Sign in";

    return [
      TextField(
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "test@test.com",
        ),
        controller: _emailController,
      ),
      SizedBox(height: 8.0),
      TextField(
        decoration: InputDecoration(
          labelText: "Password",
        ),
        controller: _passwordController,
        obscureText: true,
      ),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: _submit,
      ),
      SizedBox(height: 8.0),
      FlatButton(
        child: Text(secondaryText),
        onPressed: _toggleFormType,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

}