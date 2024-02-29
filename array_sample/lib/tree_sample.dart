import 'package:flutter/material.dart';

class TreeNode<T> {
  T data;
  TreeNode<T>? left;
  TreeNode<T>? right;

  TreeNode(this.data);
}

void inorderTraversal(TreeNode<int>? node, List<int> result) {
  if (node == null) {
    return;
  }

  inorderTraversal(node.left, result);
  result.add(node.data);
  inorderTraversal(node.right, result);
}

void preorderTraversal(TreeNode<int>? node, List<int> result) {
  if (node == null) {
    return;
  }

  result.add(node.data);
  preorderTraversal(node.left, result);
  preorderTraversal(node.right, result);
}

void postorderTraversal(TreeNode<int>? node, List<int> result) {
  if (node == null) {
    return;
  }

  postorderTraversal(node.left, result);
  postorderTraversal(node.right, result);
  result.add(node.data);
}

void main() {
  final TreeNode<int> root = TreeNode<int>(5)
    ..left = TreeNode<int>(2)       // .. cascade operator
    ..right = TreeNode<int>(6)
    ..left!.left = TreeNode<int>(3)
    ..left!.right = TreeNode<int>(4)
    ..right!.left = TreeNode<int>(8)
    ..right!.right = TreeNode<int>(9);

  runApp(MyApp(root: root));
}

class MyApp extends StatelessWidget {
  final TreeNode<int> root;

  const MyApp({super.key, required this.root});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Text('Binary Tree Traversal in Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TraversalResult(
                title: 'Inorder Traversal:',
                traversalFunction: (node, result) =>
                    inorderTraversal(node, result),
                root: root,
              ),
              const SizedBox(height: 20),
              TraversalResult(
                title: 'Preorder Traversal:',
                traversalFunction: (node, result) =>
                    preorderTraversal(node, result),
                root: root,
              ),
              const SizedBox(height: 20),
              TraversalResult(
                title: 'Postorder Traversal:',
                traversalFunction: (node, result) =>
                    postorderTraversal(node, result),
                root: root,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TraversalResult extends StatelessWidget {
  final String title;
  final void Function(TreeNode<int>?, List<int>) traversalFunction;
  final TreeNode<int> root;

  const TraversalResult({
    super.key,
    required this.title,
    required this.traversalFunction,
    required this.root,
  });

  @override
  Widget build(BuildContext context) {
    final List<int> result = [];
    traversalFunction(root, result);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 10),
            Text(
              result.join(' - '),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
