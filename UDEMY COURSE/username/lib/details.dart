import 'package:flutter/material.dart';
//import 'package:username/model/employee.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  //List<Employee> employees = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee details'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Manidhar reddy vanga'),
            subtitle: const Text(' Software engineer level-3 '),
            leading: GestureDetector(
              onTap: () {
                
                showDialog(
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        width: 300,
                        height: 400,
                        child: Image.asset('image/th.jpg',fit: BoxFit.cover,),
                      ),
                    );
                  },
                );
              },
              child: const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('image/th.jpg'),
              ),
            ),
            trailing: const Icon(Icons.computer_outlined),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('deepak'),
            subtitle: const Text('software engineer (flutter)'),
            leading: GestureDetector(
              onTap: () {
                
                showDialog(
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        width: 300,
                        height: 400,
                        child: Image.asset('image/PSX_20221106_155207.jpg',fit: BoxFit.cover,),
                      ),
                    );
                  },
                );
              },
              child: const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('image/PSX_20221106_155207.jpg'),
              ),
            ),
            trailing: const Icon(Icons.computer_outlined),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text('sumadeep reddy dnga'),
            subtitle: const Text(' Software engineer (c++) '),
            leading: InkWell(
              onTap: () {
               showDialog(
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        width: 300,
                        height: 400,
                        child: Image.asset('image/th (1).jpg',fit: BoxFit.cover,),
                      ),
                    );
                  },
                );
              },
              child: const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('image/th (1).jpg'),
              ),
            ),
            trailing: const Icon(Icons.computer_outlined),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text('charan acd'),
            subtitle: const Text(' Software engineer(react js) '),
            leading: InkWell(
              onTap: () {
                showDialog(
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        width: 300,
                        height: 400,
                        child: Image.asset('image/th (2).jpg',fit: BoxFit.cover,),
                      ),
                    );
                  },
                );
              },
              child: const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('image/th (2).jpg'),
              ),
            ),
            trailing: const Icon(Icons.computer_outlined),
          ),
        ],
      ),
    );
  }
}
