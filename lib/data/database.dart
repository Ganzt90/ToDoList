import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {

  List toDoList = [];
  //Reference our box
  final _myBox = Hive.box('mybox');
  // Run this methods it is the firts time ever opening the app
  void createInitialData(){
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }
  
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}