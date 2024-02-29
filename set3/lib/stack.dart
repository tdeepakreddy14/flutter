import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      color: Colors.black,
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DEMO',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      body: Column(
        children: [
          const Text('demo'),
          const SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: Container(
              height: 300,
              color: Colors.blue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'example 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'example 2',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.centerLeft,
            fit: StackFit.loose,
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(color: Colors.green),
                child: const Center(
                  child: Text('container - 1'),
                ),
              ),
              Container(
                //alignment: Alignment.bottomRight,
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                ),
                child: const Center(
                  child: Text('container - 2'),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 8, 8, 8),
                ),
                child: const Center(child: Text('container - 2',)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
