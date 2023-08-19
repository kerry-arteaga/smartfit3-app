import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign up with email and password
  Future<String> signUpWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String uid = userCredential.user?.uid ?? ''; // Get the UID or an empty string
      print("User created with ID: $uid");
      return uid;
    } catch (e) {
      print("Sign up failed: $e");
      throw e;
    }
  }



  // Log in with email and password
  Future<void> loginWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("Login failed: $e");
      throw e;
    }
  }

  String? getDisplayName(){
    return _auth.currentUser?.displayName;
  }

  // Log out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Check if a user is authenticated
  bool get isUserLoggedIn => _auth.currentUser != null;
  // Get the UID of the currently logged-in user
  String? get currentUserUid => _auth.currentUser?.uid;
}
