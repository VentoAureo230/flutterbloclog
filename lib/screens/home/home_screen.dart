import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclog/screens/message/message_screen.dart';
import 'package:flutterbloclog/screens/profile/profile_screen.dart';

import '../../blocs/sign_in_bloc/sign_in_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yesy'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body:  Container()
    );
  }
}
