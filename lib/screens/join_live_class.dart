import 'package:flutter/material.dart';
import '../models/trainer.dart';

class JoinLiveClassScreen extends StatelessWidget {
  const JoinLiveClassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Trainer trainer = ModalRoute.of(context)!.settings.arguments as Trainer;
    return Scaffold(
      appBar: AppBar(title: const Text('Join Live Class')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.videocam, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 24),
            Text('Live class with ${trainer.name}', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            const Text('Video integration (Zoom/Agora) goes here.'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/trainers_list')),
              child: const Text('Back to Trainers'),
            ),
          ],
        ),
      ),
    );
  }
}
