import 'package:flutter/material.dart';
import 'package:flutter_application_lectine_pal/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DotIndicator extends ConsumerWidget {
  const DotIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? Constants.indicatorColor
            : const Color.fromARGB(255, 69, 61, 61),
        border: isActive ? null : Border.all(color: Constants.indicatorColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
