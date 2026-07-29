import 'package:flutter/material.dart';

class SuccessErrorIconWidget extends StatelessWidget {
  final bool isSuccess;
  final double? iconSize;

  const SuccessErrorIconWidget({
    this.iconSize,
    super.key,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isSuccess
          ? Icon(Icons.check_circle, color: Colors.green, size: iconSize)
          : Icon(Icons.error, color: Colors.red, size: iconSize),
    );
  }
}
