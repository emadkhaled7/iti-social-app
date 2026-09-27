import 'package:flutter/material.dart';
import '../widgets/story_item.dart';
import '../widgets/chat_item.dart';
import '../widgets/profile_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 105,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: ProfileButton(),
        ),
        title: const Text(
          'Chats',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 23,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.black,
              size: 23,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 27,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              height: 120,
              child: Row(
                children: const [
                  StoryItem(
                    image: 'assets/image/joshua.png',
                    name: 'Joshua',
                  ),
                  StoryItem(
                    image: 'assets/image/martin.png',
                    name: 'Martin',
                  ),
                  StoryItem(
                    image: 'assets/image/karen.png',
                    name: 'Karen',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const ChatItem(
              image: 'assets/image/martin.png',
              name: 'Martin Randolph',
              message: 'You: What’s man!',
              time: '9:40 AM',
            ),
            const ChatItem(
              image: 'assets/image/joshua.png',
              name: 'Joshua',
              message: 'See you tomorrow!',
              time: '9:20 AM',
            ),
            const ChatItem(
              image: 'assets/image/karen.png',
              name: 'Karen',
              message: 'That sounds great!',
              time: '8:50 AM',
            ),
          ],
        ),
      ),
    );
  }
}