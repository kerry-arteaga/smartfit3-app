import 'package:flutter/material.dart';
//import 'package:smartfit3/pages/home_page.dart';
import 'package:smartfit3/pages/login_screen.dart';
//import 'package:smartfit/pages/home_page.dart';
import 'package:smartfit3/pages/pallete.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor.withOpacity(0.7),
      ),
      debugShowCheckedModeBanner: false,
      //home: const HomePage(),
      home: const LoginScreen(),
    );
  }
}
