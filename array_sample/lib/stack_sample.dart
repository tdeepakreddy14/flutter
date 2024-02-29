import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack sample'),
      ),
      body: const StackSample(),
    );
  }
}

class StackSample extends StatefulWidget {
  const StackSample({super.key});
  @override
  State<StackSample> createState() {
    return StackSampleState();
  }
}

class StackSampleState extends State<StackSample> {
  List<String> stackEle = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 240, 245, 255),
            height: 400,
            child: stackEle.isEmpty
                ? const Center(
                    child: Text(
                      'stack is empty...',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    itemCount: stackEle.length,
                    itemBuilder: (context, index) {
                      return Text(
                        stackEle[index],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(label: Text('element')),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    stackEle.insert(0, controller.text);
                    controller.clear();
                  });
                },
                icon: const Icon(Icons.arrow_downward),
                label: const Text('push'),
              ),
              const SizedBox(width: 30),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    stackEle.remove(stackEle[0]);
                  });
                },
                icon: const Icon(Icons.arrow_upward),
                label: const Text('pop'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
