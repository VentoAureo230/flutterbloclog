import 'package:flutter/material.dart';
import 'package:flutterbloclog/app_view.dart';
import 'package:flutterbloclog/blocs/auth_bloc/authentication_bloc.dart';
import 'package:flutterbloclog/blocs/edit_profile/edit_profile_bloc.dart';
import 'package:flutterbloclog/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:flutterbloclog/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutterbloclog/blocs/upload_pfp/upload_pfp_bloc.dart';
import 'package:flutterbloclog/blocs/upload_resume/upload_resume_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => MyUserBloc()),
        BlocProvider(create: (context) => EditProfileBloc()),
        BlocProvider(create: (context) => ImageUploadBloc()),
        BlocProvider(create: (context) => UploadResumeBloc()),
        BlocProvider(
            create: (context) => SignInBloc(userRepository: userRepository)),
        // Ajouter le reste de blocs ici plus tard
      ], child: const MyAppView()),
    );
  }
}
