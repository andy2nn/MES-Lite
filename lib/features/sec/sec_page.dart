import 'package:flutter/material.dart';

class SecPage extends StatelessWidget {
  const SecPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.pop(context), child: const Text('pop')),
      ),
    );
  }
}
