import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  

  const AuthHeader({
    super.key,
    required this.title,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        
        const SizedBox(height: 35),
      ],
    );
  }
}