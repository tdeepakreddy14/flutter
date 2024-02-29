import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String databaseUrl =
      'https://api-example-e87c2-default-rtdb.firebaseio.com/users.json';
  List<Map<String, dynamic>> users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
  try {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(databaseUrl));
    if (response.statusCode == 200) {
      final String rawData = response.body; // Get the raw JSON data as a string
      setState(() {
        users = [
          {'data': rawData} // Store the raw JSON data in the users list
        ];
        isLoading = false;
      });
    } else {
      print('Failed to load users. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error loading users: $error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Users Example'),
      ),
      body: isLoading
    ? const Center(
        child: CircularProgressIndicator(),
      )
    : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Data: ${users[index]['data']}'),
          );
        },
      ),
     );
    
  }
}
