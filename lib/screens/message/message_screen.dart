import 'package:flutter/material.dart';
import 'package:flutterbloclog/screens/template.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplatePage(body: Center(child: Text('Chatting Page'),));
  }
}