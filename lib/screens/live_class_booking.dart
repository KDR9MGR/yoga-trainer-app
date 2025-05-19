import 'package:flutter/material.dart';
import '../models/trainer.dart';

class LiveClassBookingScreen extends StatefulWidget {
  const LiveClassBookingScreen({Key? key}) : super(key: key);

  @override
  State<LiveClassBookingScreen> createState() => _LiveClassBookingScreenState();
}

class _LiveClassBookingScreenState extends State<LiveClassBookingScreen> {
  String? selectedSlot;

  @override
  Widget build(BuildContext context) {
    final Trainer trainer = ModalRoute.of(context)!.settings.arguments as Trainer;
    final slots = trainer.schedule;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Book Live Class'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select a slot with ${trainer.name}:'),
            const SizedBox(height: 16),
            ...slots.map((slot) => RadioListTile<String>(
                  title: Text(slot),
                  value: slot,
                  groupValue: selectedSlot,
                  onChanged: (val) {
                    setState(() {
                      selectedSlot = val;
                    });
                  },
                )),
            const Spacer(),
            ElevatedButton(
              onPressed: selectedSlot == null
                  ? null
                  : () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Booking Confirmed'),
                          content: Text('You have booked $selectedSlot with ${trainer.name}.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                                Navigator.pushReplacementNamed(context, '/join_live_class', arguments: trainer);
                              },
                              child: const Text('Join Now'),
                            ),
                          ],
                        ),
                      );
                    },
              child: const Text('Book & Join'),
            ),
          ],
        ),
      ),
    );
  }
}
