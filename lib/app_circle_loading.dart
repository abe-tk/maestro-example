import 'package:flutter/material.dart';

class AppCircleLoadingDialog extends StatelessWidget {
  const AppCircleLoadingDialog({super.key});

  static void show({
    required BuildContext context,
    bool barrierDismissible = false,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => const AppCircleLoadingDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
