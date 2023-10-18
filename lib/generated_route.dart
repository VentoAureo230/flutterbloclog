import 'package:flutter/material.dart';
import 'package:flutterbloclog/screens/home/home_screen.dart';
import 'package:flutterbloclog/screens/message/message_screen.dart';
import 'package:flutterbloclog/screens/profile/profile_screen.dart';
import 'package:flutterbloclog/screens/settings/settings_screen.dart';

class GeneratedRoute {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case '/messages':
        return MaterialPageRoute(builder: (context) => const ChatScreen());
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case '/settings':
        return MaterialPageRoute(builder: (context) => const SettingScreen());
      default:
    }
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                  child: Text(
                      'Oops! The page you are looking for doesn\'t exist or has been removed. Contact the administator if you think its an error !')),
            ));
  }
}
