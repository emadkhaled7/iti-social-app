import 'package:flutter/material.dart';

class ProfileTag extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const ProfileTag({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 13,
        ),
      ),
    );
  }
}