import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onChattingPressed;
  final VoidCallback onProfilePressed;

  const MyBottomNavBar({super.key, 
    required this.onHomePressed,
    required this.onChattingPressed,
    required this.onProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          onHomePressed();
        } else if (index == 1) {
          onChattingPressed();
        } else if (index == 2) {
          onProfilePressed();
        } 
      },
    );
  }
}
