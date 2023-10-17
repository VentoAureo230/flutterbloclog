import 'package:flutter/material.dart';
import 'package:flutterbloclog/screens/template.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: TemplatePage(
          body: Center(child: Text('HomeScreen'),),
        ));
  }
}
