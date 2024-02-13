import 'package:flutter/material.dart';
import 'package:secondapp/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('deepak app'),
        ),
        body: const GradientContainer(
          [
            Color.fromARGB(255, 14, 50, 112),
            Color.fromARGB(255, 120, 163, 238),
            Color.fromARGB(255, 14, 50, 112),
          ],
        ),
      ),
    ),
  );
}
