import 'package:flutter/material.dart';

/// A mock implementation of the chat bottom sheet widget for testing
class MockChatBottomSheetWidget {
  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.assistant),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Meditation Assistant',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),
            const Expanded(
              child: Center(
                child: Text('[Mock Chat Content]'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
