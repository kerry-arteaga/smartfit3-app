import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:smartfit3/logic/auth_manager.dart'; // Import your authentication class
import 'package:smartfit3/logic/firestore_manager.dart'; // Import your Firestore service class
import 'package:smartfit3/pages/client_page.dart'; // Import the client page
import 'package:smartfit3/pages/trainer_page.dart'; // Import the trainer page
import 'package:smartfit3/pages/login_page.dart'; // Import the trainer page
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartfit3/logic/enums.dart';
import 'firebase_options.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthWidget(), // Use the authentication widget as the initial screen
    );
  }
}

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthManager authService = AuthManager();
    final FirestoreManager firestoreService = FirestoreManager(); // Create an instance here

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;

          if (user == null) {
            return LoginPage(authManager: authService);
          } else {
            return FutureBuilder<UserType>(
              future: firestoreService.getUserType(user.uid), // Use the instance here
              builder: (context, userTypeSnapshot) {
                if (userTypeSnapshot.connectionState == ConnectionState.done) {
                  final UserType userType = userTypeSnapshot.data!;
                  if (userType == UserType.Client) {
                    return ClientPage();
                  } else {
                    return TrainerPage();
                  }
                }
                return CircularProgressIndicator();
              },
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}


// Define UserType enum and other classes as needed
// ...



