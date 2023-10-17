import 'package:flutter/material.dart';
import 'package:flutterbloclog/screens/my_navbar.dart';

class TemplatePage extends StatefulWidget {
  final Widget body;

  const TemplatePage({super.key, required this.body});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: MyBottomNavBar(
        onHomePressed: () {
          Navigator.of(context).pushNamed('/home');
        },
        onChattingPressed: () {
          Navigator.of(context).pushNamed('/messages');
        },
        onProfilePressed: () {
          Navigator.of(context).pushNamed('/profile');
        },
      ),
    );
  }
}
