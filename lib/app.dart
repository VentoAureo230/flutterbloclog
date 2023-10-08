import 'package:flutter/material.dart';
import 'package:flutterbloclog/app_view.dart';
import 'package:flutterbloclog/blocs/auth_bloc/authentication_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: const MyAppView(),
    );
  }
}
