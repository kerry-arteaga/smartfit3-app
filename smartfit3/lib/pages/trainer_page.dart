import 'package:flutter/material.dart';

class TrainerPage extends StatelessWidget {
  final String? trainerName;
  const TrainerPage({required this.trainerName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trainer Page')),
      body: Center(
        child: SingleChildScrollView(
          child: Text('Welcome, $trainerName'),
        ),
      ),
    );
  }
}
