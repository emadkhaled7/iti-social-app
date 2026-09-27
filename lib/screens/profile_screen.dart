import 'package:flutter/material.dart';
import '../widgets/profile_tag.dart';
import '../widgets/report_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.grey,
                      size: 27,
                    ),
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Colors.grey,
                      size: 27,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 62,
                        backgroundImage: AssetImage(
                          'assets/image/profile.png',
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 4,
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: const Icon(
                            Icons.sync,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joe',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Analyzer',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        'Change profile',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 27),
              const Text(
                'Strong side:',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Wrap(
                spacing: 7,
                runSpacing: 7,
                children: [
                  ProfileTag(
                    text: 'Analytics',
                    backgroundColor: Color(0xFFEAF8F6),
                    textColor: Color(0xFF3B9D92),
                  ),
                  ProfileTag(
                    text: 'Perfectionism',
                    backgroundColor: Color(0xFFEAF8F6),
                    textColor: Color(0xFF3B9D92),
                  ),
                  ProfileTag(
                    text: 'Analytics',
                    backgroundColor: Color(0xFFEAF8F6),
                    textColor: Color(0xFF3B9D92),
                  ),
                ],
              ),
              const SizedBox(height: 23),
              const Text(
                'Weak side:',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Wrap(
                spacing: 7,
                children: [
                  ProfileTag(
                    text: 'Perfectionism',
                    backgroundColor: Color(0xFFFFEEEE),
                    textColor: Colors.redAccent,
                  ),
                  ProfileTag(
                    text: 'Analytics',
                    backgroundColor: Color(0xFFFFEEEE),
                    textColor: Colors.redAccent,
                  ),
                ],
              ),
              const SizedBox(height: 31),
              const Text(
                'My Reports:',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.92,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ReportCard(
                    title: 'Astro-psychological report',
                    description:
                        'Some short description of this type of report.',
                    icon: Icons.person_outline,
                    color: Colors.indigo,
                    backgroundColor: Color(0xFFF3F1FF),
                  ),
                  ReportCard(
                    title: 'Monthly prediction report',
                    description:
                        'Some short description of this type of report.',
                    icon: Icons.calendar_month_outlined,
                    color: Color(0xFF329B90),
                    backgroundColor: Color(0xFFF0FAF8),
                  ),
                  ReportCard(
                    title: 'Daily Prediction',
                    description:
                        'Some short description of this type of report.',
                    icon: Icons.fact_check_outlined,
                    color: Colors.redAccent,
                    backgroundColor: Color(0xFFFFF1F1),
                  ),
                  ReportCard(
                    title: 'Love report',
                    description:
                        'Some short description of this type of report.',
                    icon: Icons.favorite_border,
                    color: Colors.pink,
                    backgroundColor: Color(0xFFFFF3F9),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}