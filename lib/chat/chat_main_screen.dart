import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/chat/chat_screen.dart';

class ChatMainScreen extends StatelessWidget {
  const ChatMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ChatScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: ''),
        ],
      ),
    );
  }
}
