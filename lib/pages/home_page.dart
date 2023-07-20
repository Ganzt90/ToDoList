import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/utils/dialog_box.dart';
import 'package:to_do_list/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Reference the hive Box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if is this the first time ever opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // There already exists data 
      db.loadData();
    }
    super.initState();
  }

  // Text Controller 
  final _controller = TextEditingController();
  

  
  void checkBoxchanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add( [_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(context: context, builder: (context) {
        return DialogBox(
          controller: _controller,
          onSaved: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text('To Do'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              TaskName: db.toDoList[index][0], 
              TaskCompleted: db.toDoList[index][1], 
              onChanged: (value) => checkBoxchanged(value,index),
              deleteFunction: (context) => deleteTask(index),
              );
          },       
      ),
    );
  }
}