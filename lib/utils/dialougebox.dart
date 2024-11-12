// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

class Dialougebox extends StatelessWidget {
  final todoController;
  VoidCallback onSave;
  VoidCallback onCancel;
  Dialougebox(
      {super.key,
      required this.todoController,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter todo"),
                controller: todoController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                SizedBox(
                  width: 10,
                ),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
