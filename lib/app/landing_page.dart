import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tutorial_1/app/sign_in/sign_in_page.dart';
import 'package:flutter_tutorial_1/services/auth.dart';
import 'package:flutter_tutorial_1/services/auth_provider.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final auth = AuthProvider.of(context);
      return StreamBuilder<User> (
        stream: auth.authStateChanges(), // todo: this somehow might cause bug??
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) { // todo: or maybe this ??
            final User user = snapshot.data;
            if (user == null) {
              return SignInPage();
            }
            return HomePage();
          }
          return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
      );
    }

  }


