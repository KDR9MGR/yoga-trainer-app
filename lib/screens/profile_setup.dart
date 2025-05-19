import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Setup')),
      body: const Center(child: Text('Profile Setup Screen Placeholder')),
    );
  }
}
