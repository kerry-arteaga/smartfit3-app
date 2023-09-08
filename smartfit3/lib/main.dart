import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:smartfit3/logic/auth_manager.dart'; // Import your authentication class
import 'package:smartfit3/pages/login_screen.dart';
import 'firebase_options.dart';

AuthManager authManager = AuthManager();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      //theme: ThemeData(
        //primarySwatch: Colors.blueGrey,
      //),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoginScreen(authManager: authManager), // Use the authentication widget as the initial screen
    );
  }
}





