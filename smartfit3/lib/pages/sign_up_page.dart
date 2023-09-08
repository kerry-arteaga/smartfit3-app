import 'package:flutter/material.dart';
import 'package:smartfit3/logic/auth_manager.dart';
import 'package:smartfit3/pages/login_screen.dart';
import 'package:smartfit3/logic/enums.dart';
import 'package:smartfit3/logic/models.dart';
import 'package:smartfit3/logic/firestore_manager.dart';

class SignUpScreen extends StatefulWidget {
  AuthManager authManager = AuthManager();


  SignUpScreen({required this.authManager});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _isLoading = false;
  UserType _selectedUserType = UserType.Client; // Default selected user type
  String _selectedTrainerId = ''; // Store the selected trainer ID
  String _selectedSpecialty = '';

  void _signUp() async {
    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text;
    final password = _passwordController.text;
    final userType = _selectedUserType; // Get the selected user type

    try {
      await widget.authManager.signUpWithEmail(email, password);
    } catch (e) {
      // Handle sign-up error
      print("Sign-up error: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

   void _registerUser() async {
    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text;
    final password = _passwordController.text;
    final verifyPassword = _verifyPasswordController.text; // New

    // Validation checks for fields, password match, etc.
    if (password != verifyPassword) {
      // Show password mismatch error
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final userType = _selectedUserType;

    try {
      // Create user in Firebase Authentication
      final userId = await widget.authManager.signUpWithEmail(email, password);

      // Create a unique ID for both client and trainer
      final id = userId; // Use the Firebase Auth user ID

      // Build the user instance based on userType
      if (userType == UserType.Trainer) {
        final trainer = Trainer(
          id: id,
          name: _nameController.text,
          email: email,
          specialty: _selectedSpecialty,
        );
        // Save client data to Firestore
        await FirestoreManager().createTrainer(trainer);

      }else if (userType == UserType.Client) {
        final client = Client(
          id: id,
          name: _nameController.text,
          email: email,
          phoneNumber: _phoneNumberController.text,
          trainerId: _selectedTrainerId,
        );
        // Save trainer data to Firestore
        await FirestoreManager().createClient(client);
      }
    } catch (e) {
      // Handle sign-up error
      print("Sign-up error: $e");
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
        child: SingleChildScrollView(
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
            Column(
              children: <Widget>[
                ListTile(
                  title: Text('Client'),
                  leading: Radio(
                    value: UserType.Client,
                    groupValue: _selectedUserType,
                    onChanged: (value) {
                      setState(() {
                        _selectedUserType = value as UserType;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Trainer'),
                  leading: Radio(
                    value: UserType.Trainer,
                    groupValue: _selectedUserType,
                    onChanged: (value) {
                      setState(() {
                        _selectedUserType = value as UserType;
                      });
                    },
                  ),
                ),
                  Visibility(
                    visible: _selectedUserType == UserType.Client,
                      child: Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Name",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          TextField(
                            controller: _emailController,
                            // ... Other properties ...
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          // Similar fields for password, verify password, and phone number
                          TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          TextField(
                            controller: _verifyPasswordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Verify Password",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          TextField(
                            controller: _phoneNumberController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Phone Number",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _isLoading ? null : _registerUser,
                            child: _isLoading ? CircularProgressIndicator() : Text("Sign Up as Client"),
                          ),
                        ],
                      ),
                  ),
                  Visibility(
                    visible: _selectedUserType == UserType.Trainer,
                      child: Column(
                        children: [
                          // ... Other form fields ...

                          TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Name",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          TextField(
                            controller: _emailController,
                            // ... Other properties ...
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          // Similar fields for password, verify password, and phone number
                          TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          TextField(
                            controller: _verifyPasswordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Verify Password",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          TextField(
                            controller: _phoneNumberController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Phone Number",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _isLoading ? null : _registerUser,
                            child: _isLoading ? CircularProgressIndicator() : Text("Sign Up as Trainer"),
                          ),
                        ],
                      ),
                  ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///ElevatedButton(
                ///  style: ButtonStyle(
                ///    backgroundColor: MaterialStateProperty.all(Colors.blue),
                ///    foregroundColor: MaterialStateProperty.all(Colors.white),
                ///  ),
                ///  onPressed: _isLoading ? null : _signUp,
                ///  child: _isLoading ? CircularProgressIndicator() : Text("Sign Up"),
                ///),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    // Navigate to login screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(authManager: widget.authManager),
                      ),
                    );
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}
