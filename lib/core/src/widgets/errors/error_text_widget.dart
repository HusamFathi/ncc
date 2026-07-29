import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String? error;

  const ErrorTextWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return error != null
        ? Text(
            error!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          )
        : const SizedBox();
  }
}
