import 'package:flutter/material.dart';

class PlainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const PlainButton({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
