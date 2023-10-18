import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclog/blocs/auth_bloc/authentication_bloc.dart';
import 'package:flutterbloclog/generated_route.dart';
import 'package:flutterbloclog/screens/components/persistent_navbar.dart';
import 'package:flutterbloclog/screens/auth/welcome_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Authentication',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            background: Colors.white,
            onBackground: Colors.black,
            primary: Color.fromRGBO(206, 147, 216, 1),
            onPrimary: Colors.black,
            secondary: Color.fromRGBO(244, 143, 177, 1),
            onSecondary: Colors.white,
            tertiary: Color.fromRGBO(255, 204, 128, 1),
            error: Colors.red,
            outline: Color(0xFF424242)),
      ),
      onGenerateRoute: GeneratedRoute.generatedRoute,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return const PersistentTabScreen();
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
