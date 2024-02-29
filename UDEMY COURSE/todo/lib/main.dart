import 'package:flutter/material.dart';
import 'package:todo/screen/home_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 155)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

