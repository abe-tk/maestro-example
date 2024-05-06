import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Home Page!'),
            const SizedBox(height: 36),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
