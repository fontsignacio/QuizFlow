import 'package:flutter/material.dart';
import 'package:quiz_flow/Widgets/login.dart';
//import 'package:quiz_flow/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    title: "QuizFlow",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color.fromARGB(255, 61, 189, 78),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 219, 233, 246),
    ),
    home: const Login(),
  ));
}
