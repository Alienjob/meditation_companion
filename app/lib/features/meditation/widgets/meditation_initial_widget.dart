import 'package:flutter/material.dart';

class MeditationInitialWidget extends StatelessWidget {
  final Function(int) onStartSession;

  const MeditationInitialWidget({
    super.key,
    required this.onStartSession,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('00:00', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 32),
          const Text('Select Duration'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _DurationButton(
                minutes: 1,
                onPressed: () => onStartSession(1),
              ),
              _DurationButton(
                minutes: 5,
                onPressed: () => onStartSession(5),
              ),
              _DurationButton(
                minutes: 10,
                onPressed: () => onStartSession(10),
              ),
              _DurationButton(
                minutes: 15,
                onPressed: () => onStartSession(15),
              ),
              _DurationButton(
                minutes: 20,
                onPressed: () => onStartSession(20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DurationButton extends StatelessWidget {
  final int minutes;
  final VoidCallback onPressed;

  const _DurationButton({
    required this.minutes,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('$minutes min'),
    );
  }
}
