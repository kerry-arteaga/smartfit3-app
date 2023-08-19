import 'package:flutter/material.dart';
import 'package:smartfit3/logic/auth_manager.dart';
import 'package:smartfit3/logic/firestore_manager.dart';
import 'package:smartfit3/pages/sign_up_page.dart';
import 'package:smartfit3/logic/enums.dart';
import 'package:smartfit3/pages/client_page.dart';
import 'package:smartfit3/pages/trainer_page.dart';

class LoginScreen extends StatefulWidget {
  AuthManager authManager = AuthManager();

  LoginScreen({required this.authManager});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await widget.authManager.loginWithEmail(email, password);
      final uid = widget.authManager.currentUserUid;

      if (uid != null && uid.isNotEmpty) {
        // Fetch user type from Firestore
        UserType userType = await FirestoreManager().getUserType(uid);
        String? name = await FirestoreManager().getUserNameByUID(uid);

        // Navigate to the appropriate page based on userType
        if (userType == UserType.Client) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ClientPage(clientName: name),
            ),
          );
        } else if (userType == UserType.Trainer) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TrainerPage(trainerName: name),
            ),
          );
        }
      } else {
        // Handle the case where uid is null or empty
        print("UID is null or empty");
      }
    } catch (e) {
      // Handle login error
      print("Login error: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('images/smartfitlogotransparent.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(height: 10),
            //crossAxisAlignment: CrossAxisAlignment.start,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: TextField(
                controller: _emailController,
                style: const TextStyle(
                  height: 1,
                  fontSize: 15,
                  //backgroundColor: Colors.black,
                  color: Colors.blue,
                ),
                enabled: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                ),
              ),
            ),
            //const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                style: const TextStyle(
                  height: 1,
                  fontSize: 15,
                  //backgroundColor: Colors.black,
                  color: Colors.blue,
                ),
                enabled: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading ? CircularProgressIndicator() : Text("Login"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => SignUpScreen(authManager: widget.authManager),
                        ),
                    );
                  },
                  child: const Text("sign up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
