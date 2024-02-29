import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key}); 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override


  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This function will be executed after the first frame is rendered
      print('First frame rendered!');
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('addPostFrameCallback Example'),
      ),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}



