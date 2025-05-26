import 'package:flutter/material.dart';

class MeditationCompletedWidget extends StatelessWidget {
  final VoidCallback onStartNew;

  const MeditationCompletedWidget({
    super.key,
    required this.onStartNew,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            size: 64,
            color: Colors.green,
          ),
          const SizedBox(height: 16),
          const Text(
            'Meditation session completed!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onStartNew,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Start New Session'),
          ),
        ],
      ),
    );
  }
}
