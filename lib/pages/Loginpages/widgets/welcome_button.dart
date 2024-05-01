import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final Key? key;
  final String? buttonText;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;

  const WelcomeButton({
    this.key,
    this.buttonText,
    this.onTap,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: color ?? Colors.blue, // Default color if not provided
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          buttonText ?? '', // Empty string if buttonText is not provided
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white, // Default text color if not provided
          ),
        ),
      ),
    );
  }
}
