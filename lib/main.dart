import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloclog/firebase_options.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutterbloclog/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp(FirebaseUserRepo()));
}
