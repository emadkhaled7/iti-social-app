import 'package:app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
          child: const CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(
              'assets/image/profile.png',
            ),
          ),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_outline,
              color: Colors.black,
              size: 21,
            ),
          ),
        ),
      ],
    );
  }
}