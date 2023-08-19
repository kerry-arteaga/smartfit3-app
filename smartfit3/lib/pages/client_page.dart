import 'package:flutter/material.dart';

class ClientPage extends StatelessWidget {
  final String? clientName;
  const ClientPage({required this.clientName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Client Page')),
      body: Center(
        child: SingleChildScrollView(
          child: Text('Welcome, $clientName'),
        ),
      ),
    );
  }
}
