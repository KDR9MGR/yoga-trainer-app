import 'package:flutter/material.dart';
import '../models/trainer.dart';
import '../utils/theme.dart';

class TrainerProfileScreen extends StatelessWidget {
  const TrainerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Trainer trainer = ModalRoute.of(context)!.settings.arguments as Trainer;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(trainer.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Hero(
              tag: 'trainer_${trainer.id}',
              child: CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(trainer.imageUrl),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              trainer.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.sports_gymnastics, 'Specializations: ${trainer.specializations.join(', ')}'),
            _buildInfoRow(Icons.work, 'Experience: ${trainer.experience} years'),
            _buildInfoRow(Icons.star, 'Rating: ⭐ ${trainer.rating}'),
            const SizedBox(height: 16),
            if (trainer.introVideoUrl != null)
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.play_circle_outline, size: 64),
                ),
              ),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.calendar_today, 'Schedule: ${trainer.schedule.join(', ')}'),
            _buildInfoRow(Icons.attach_money, 'Pricing: \$${trainer.pricing.toStringAsFixed(2)} per class'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/live_class_booking', arguments: trainer);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Book a Class',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryGreen, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
