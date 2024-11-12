import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
 await  Hive.initFlutter();
 // here we open the hive box to store the value on other pages we access this openbox using box

 
 var box = await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}