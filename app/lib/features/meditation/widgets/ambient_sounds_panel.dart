import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/meditation_bloc.dart';
import '../bloc/meditation_state.dart';
import 'ambient_sounds_widget.dart';

class AmbientSoundsPanel extends StatelessWidget {
  const AmbientSoundsPanel({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeditationBloc, MeditationState>(
      builder: (context, state) {
        if (state is MeditationActive) {
          final content = AmbientSoundsWidget(state: state);
          if (scrollController != null) {
            return ListView(
              controller: scrollController,
              padding: EdgeInsets.zero,
              children: [content],
            );
          }
          return content;
        }

        return _AmbientPanelEmptyState(scrollController: scrollController);
      },
    );
  }
}

class _AmbientPanelEmptyState extends StatelessWidget {
  const _AmbientPanelEmptyState({this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final placeholder = Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Start a meditation session to control ambient sounds.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );

    if (scrollController != null) {
      return ListView(
        controller: scrollController,
        padding: EdgeInsets.zero,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 200),
            child: placeholder,
          ),
        ],
      );
    }

    return placeholder;
  }
}
