import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/connectivity_cubit.dart';
import '../cubit/connectivity_state.dart';

/// Banner widget displaying connectivity status for multiple services
class ConnectivityBanner extends StatelessWidget {
  const ConnectivityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (!state.shouldShowBanner) {
          return const SizedBox.shrink();
        }

        return AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          offset: state.shouldShowBanner ? Offset.zero : const Offset(0, -1),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: state.shouldShowBanner ? 1.0 : 0.0,
            child: Material(
              color: _getBannerColor(state),
              elevation: 4,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _getBannerIcon(state),
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          state.statusMessage,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          context.read<ConnectivityCubit>().dismissBanner();
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getBannerColor(ConnectivityState state) {
    if (state.allOnline) {
      return Colors.green.shade700;
    } else if (state.allOffline) {
      return Colors.grey.shade700;
    } else {
      return Colors.orange.shade700;
    }
  }

  IconData _getBannerIcon(ConnectivityState state) {
    if (state.allOnline) {
      return Icons.check_circle_outline;
    } else if (state.allOffline) {
      return Icons.cloud_off_outlined;
    } else {
      return Icons.warning_amber_outlined;
    }
  }
}
