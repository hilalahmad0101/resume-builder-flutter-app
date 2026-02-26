import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resumes'),
      ),
      body: Center(
        child: const Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new resume
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
