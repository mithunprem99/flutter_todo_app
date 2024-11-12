import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialougebox.dart';
import 'package:todo_app/utils/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();
  List todoList = [
    [
      "Make An App",
      false,
    ],
    [
      "Do pass in gov exam",
      false,
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          elevation: 2,
          shadowColor: Colors.black,
          title: Text("TODO"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.amber[400],
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: todoList[index][0],
                taskCompleted: todoList[index][1],
                onChanged: (value) => checkboxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialougebox(
            todoController: _controller,
            onSave: saveNewTask,
            onCancel: Navigator.of(context).pop,
          );
        });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
}
