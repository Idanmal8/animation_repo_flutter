import 'package:animation_samples/select_users_stack/select_users_stack.dart';
import 'package:flutter/material.dart';

class SelectStackUserList extends StatelessWidget {
  const SelectStackUserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Stack User List'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
          childAspectRatio: 1, // Aspect ratio of the grid items
          mainAxisSpacing: 10, // Spacing between rows
          crossAxisSpacing: 10, // Spacing between columns
        ),
        padding: const EdgeInsets.all(10),
        itemCount: 8, // Number of items in the grid
        itemBuilder: (context, index) {
          return const SelectUsersStack(size: 50); // Adjust size as needed
        },
      ),
    );
  }
}