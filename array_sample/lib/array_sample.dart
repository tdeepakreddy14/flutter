import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Array Sample'),
        ),
        body: const ArraySample(),
      ),
    );
  }
}

class ArraySample extends StatefulWidget {
  const ArraySample({super.key});
  @override
  State<ArraySample> createState() {
    return ArraySampleState();
  }
}

class ArraySampleState extends State<ArraySample> {
  List<String> arrayEle = ['a', 'b', 'c'];

  void addItem(String newItem) {
    setState(() {
      arrayEle.add(newItem);
    });
  }

  Future<void> delItem(String item) async {
    if (arrayEle.contains(item)) {
      setState(() {
        arrayEle.remove(item);
      });
    } //else {}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 237, 247, 255),
            child: arrayEle.isEmpty
                ? const Center(
                    child: Text(
                    'Array is empty...',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ))
                : ListView.builder(
                    itemCount: arrayEle.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          arrayEle[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _showAddItemDialog();
                },
                label: const Text('add item'),
                icon: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _showDelItemDialog();
                },
                icon: const Icon(Icons.delete),
                label: const Text('del item'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _showAddItemDialog() {
    final TextEditingController controller = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Item'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter item'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                addItem(controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDelItemDialog() async {
    final TextEditingController controllerDel = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Del Item'),
          content: TextField(
            controller: controllerDel,
            decoration: const InputDecoration(hintText: 'Enter item'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (arrayEle.contains(controllerDel.text)) {
                  delItem(controllerDel.text);
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pop();

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Item Not Found',style: TextStyle(color: Colors.red),),
                        content: Text(
                            '${controllerDel.text} doesn\'t exists.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Del'),
            ),
          ],
        );
      },
    );
  }
}
