//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:smartfit3/pages/pallete.dart';
import 'package:smartfit3/styles/glass_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Container(
        alignment: const Alignment(0, 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/smartfitlogotransparent.png'),
          ),
        ),
        child: const Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  GlassBox(
                    height: 400.0,
                    width: 340.0,
                    child: Center(
                      child: Image(
                        image: AssetImage('images/weights.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
