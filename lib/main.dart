import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homebase/connect.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyD2LXxcPvSwYdoQa2i7c_BIC1V8lz6aGbg',
          appId: "1:880063978656:web:5013b8576f035825223dc5",
          messagingSenderId: "880063978656",
          projectId: "hb2024-9bddd",
          authDomain: "hb2024-9bddd.firebaseapp.com",
          storageBucket: "hb2024-9bddd.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo2',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: Colors.white),
        ),
        home: connect());
  }
}
