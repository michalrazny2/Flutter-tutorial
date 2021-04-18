import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1/app/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_tutorial_1/services/auth.dart';
import 'package:flutter_tutorial_1/services/auth_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
    create: (cotext) => Auth(),
    child: MaterialApp(
      title: 'Time tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
        home: LandingPage(),
      )
    );
  }
}
