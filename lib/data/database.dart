import 'package:hive_flutter/hive_flutter.dart';

class TodoDatbase {
  List todoList = [];
  final _mybox = Hive.box('mybox');

//run this method on first time ever opening the app
  void createInitialData() {
    todoList = [
      ["Make tutorial", false],
      ["Do pass in gov Exam", false]
    ];
  }

  //load the data from database

  void loadDatafromDatabase(){

    //hive mainly work based on the key value pair 
    todoList = _mybox.get("TODOLIST");
  }


  //update the database

  void updateDatabase(){
_mybox.put("TODOLIST", todoList);
  }
}
