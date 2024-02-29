import 'package:flutter/material.dart';

class Node<T> {  //generic type.
  T? value;
  Node<T>? next;

  Node(this.value);
}

class LinkedList<T> {
  Node<T>? head;

  bool get isEmpty => head == null;

  void add(T value) {
    final newNode = Node<T>(value);
    if (isEmpty) {
      head = newNode;
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  // Remove the first node with the given value
  void remove(T value) {
    if (isEmpty) return;

    if (head!.value == value) {
      // If the value is in the head node, update the head to the next node
      head = head!.next;
      return;
    }

    var current = head;
    while (current!.next != null) {
      if (current.next!.value == value) {
        current.next = current.next!.next;
        return;
      }
      current = current.next;
    }
  }

  List<T> getList() {
    var current = head;
    List<T> list = [];
    while (current != null) {
      list.add(current.value!);
      current = current.next;
    }
    return list;
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final linkedList = LinkedList<dynamic>();
  TextEditingController controller = TextEditingController();
  List<dynamic> elements = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linked List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                label: Text('enter an element'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    linkedList.add(controller.text);
                    controller.clear();
                    elements = linkedList.getList();
                  });
                },
                child: const Text('Add item'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    linkedList.remove(controller.text);
                    controller.clear();
                    elements = linkedList.getList();
                  });
                },
                child: const Text('del item'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: elements.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Element : ${elements[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
