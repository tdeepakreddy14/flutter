import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Items',
                  style: TextStyle(color: Colors.black),
                  softWrap: true,
                ),
                background: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Image.asset('images/ss.jpg', fit: BoxFit.fill),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('item count $index'),
                ),
                childCount: 10,
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Text('grid view $index'),
                  childCount: 5,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                ))
          ],
        ),
      ),
    );
  }
}
