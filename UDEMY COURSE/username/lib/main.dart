import 'package:flutter/material.dart';
import 'package:username/login_Screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 25, 25, 26),
        title: const Text(
          'Login page',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: const LoginSceen(),
    ),
  ));
}
