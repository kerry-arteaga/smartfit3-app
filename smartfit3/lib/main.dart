import 'package:flutter/material.dart';
import 'package:smartfit3/pages/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const HomePage(),
      home: const LoginScreen(),
      //home: const HiddenDrawer(),
      theme: ThemeData.dark(),
    );
  }
}
