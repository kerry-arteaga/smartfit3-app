import "package:flutter/material.dart";
import "package:smartfit3/pages/hidden_drawer.dart";
//import 'package:smartfit/pages/pallete.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: TextField(
                style: TextStyle(
                  height: 1,
                  fontSize: 15,
                  //backgroundColor: Colors.black,
                  color: Colors.blue,
                ),
                enabled: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 57, 77, 94)),
                ),
              ),
            ),
            //const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(
                  height: 1,
                  fontSize: 15,
                  //backgroundColor: Colors.black,
                  color: Colors.blue,
                ),
                enabled: true,
                decoration: InputDecoration(
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HiddenDrawer()));
                  },
                  child: const Text("login"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {},
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
