import 'package:flutter/material.dart';
import 'package:todo/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  List toDoList = [
    ["Flutter", false],
    ["Drink Coffee", false],
    //["Wake up 7am", false],
  ];

  void checkBoxChange(int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  void saveTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
    });
  }
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        //foregroundColor: Colors.black,
        title: const Text("ToDo"),
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index){
        return ToDoList(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxChange(index),
          deleteFunction: (value) => deleteTask(index),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text("Add toDo"),
              content: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Add new task",
                  border: OutlineInputBorder()
                ),
              ),
              actions: [
                TextButton(
                    onPressed: (){
                      saveTask();
                      _controller.clear();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar
                        (content: Text("task added")
                      ));
                      Navigator.pop(context);
                    },
                    child: Text("Add")
                ),
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Cancle")
                ),
              ],
            );
          });
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
