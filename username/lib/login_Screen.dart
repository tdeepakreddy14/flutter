import 'package:flutter/material.dart';
import 'package:username/details.dart';

class LoginSceen extends StatefulWidget {
  const LoginSceen({super.key});

  @override
  State<LoginSceen> createState() => _LoginSceenState();
}

class _LoginSceenState extends State<LoginSceen> {
  final userName = TextEditingController();
  final password = TextEditingController();

  void validateLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); //This method calls the onSaved

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Details(),
        ),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(255, 0, 140, 255),
            Color.fromARGB(255, 192, 212, 247),
            // Color.fromARGB(255, 0, 140, 255),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: userName,
                decoration: const InputDecoration(
                  label: Text('user name',style: TextStyle(fontSize: 18),),
                  contentPadding: EdgeInsets.all(8),
                ),
                //controller: userName,
                validator: (value) {
                  if (value == null || value.isEmpty || value.contains(' ')) {
                    return 'Enter user name';
                  }
                  if(!isValidEmail(value)){
                    return 'enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  label: Text('Password',style: TextStyle(fontSize: 18),),
                  contentPadding: EdgeInsets.all(8),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password';
                  }
                  if (value.length < 6) {
                    return 'Password should contain atleast 6 char';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 19),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: validateLogin,
                    child: const Text('login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
bool isValidEmail(String email) {
    // Simple email validation using regex
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(email);
  }
