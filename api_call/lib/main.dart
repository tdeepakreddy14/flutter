import 'dart:convert';
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
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> loadedUsers = [];
        data.forEach((key, value) {
          loadedUsers.add({...value, 'id': key});
        });
        print(loadedUsers);
        setState(() {
          users = loadedUsers;
          isLoading=false;
        });
      } else {
        print('Failed to load users. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading users: $error');
    }
  }

  Future<void> addUser(String name, String email) async {
    try {
      final response = await http.post(
        Uri.parse(databaseUrl),
        body: json.encode({
          'name': name,
          'email': email,
        }),
      );
      if (response.statusCode == 200) {
        print('User added successfully');
        setState(() {
          loadUsers();
        });
        //print(users);
      } else {
        print('Failed to add user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error adding user: $error');
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      String delUri =
          'https://api-example-e87c2-default-rtdb.firebaseio.com/users/$id.json';
      final response = await http.delete(Uri.parse(delUri));
      print(response.statusCode);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        setState(() {
          users.removeWhere((user) => user['id'] == id);
        });
      } else {
        print('Failed to delete user: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to delete user: $e');
    }
  }

  Future<void> updateUser(String id) async {
    String putUrl =
        'https://api-example-e87c2-default-rtdb.firebaseio.com/users/$id.json';
    try {
      final response = await http.put(
        Uri.parse(putUrl),
        body: json
            .encode({'name': 'Updated User', 'email': 'updated@example.com'}),
      );
      if (response.statusCode == 200) {
        print('User updated successfully');
        final Map<String,dynamic>updatedUser = json.decode(response.body);
        setState(() {
          final index = users.indexWhere((user) => user['id'] == id);
          users[index] = {
            'name': updatedUser['name'],
            'email': updatedUser['email'],
          };
          loadUsers();
        }
        );
        print(users);
      } else {
        print('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating user: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Users Example'),
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(users[index]['id'].toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              deleteUser(users[index]['id']);
            },
            child: ListTile(
              title: Text(users[index]['name']),
              subtitle: Text(users[index]['email']),
              onLongPress: () {
                updateUser(users[index]['id']);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addOverLay,
        tooltip: 'Add User',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> addOverLay() async {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerEmail = TextEditingController();
    showDialog(
      
      context: context,
      builder: (context) {
        return AlertDialog( 
                   
          title: const Text('add user'),
          content: Column(
            children: [
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerEmail,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  addUser(controllerName.text, controllerEmail.text);
                  Navigator.of(context).pop();
                });
              },
              child: const Text('add'),
            ),
          ],
        );
      },
    );
  }
}
