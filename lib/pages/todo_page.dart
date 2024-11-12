import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialougebox.dart';
import 'package:todo_app/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _mybox = Hive.box('mybox');

  final _controller = TextEditingController();
  TodoDatbase db = TodoDatbase();

  @override
  //if this is the first time opening the app then create the default data

  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exist data

      db.loadDatafromDatabase();
    }
    super.initState();
  }

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
            itemCount: db.todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: db.todoList[index][0],
                taskCompleted: db.todoList[index][1],
                onChanged: (value) => checkboxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
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
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }
}
