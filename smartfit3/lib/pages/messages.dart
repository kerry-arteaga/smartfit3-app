import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

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
      ),
    );
  }
}
