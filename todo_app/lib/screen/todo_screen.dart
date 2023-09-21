import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../services/api_calls.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late List<TodoList> todos;
  TextEditingController _taskTxtController = TextEditingController();
  @override
  void initState() {
    todos = [];
    fetchAllTodos();
    super.initState();
  }

  fetchAllTodos() async {
    todos = await APICalls.fetchTodos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Todo App')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskTxtController,
                      decoration: InputDecoration(
                        hintText: 'Enter task name',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      //logic to add data in to list
                      if (_taskTxtController.text.isNotEmpty) {
                        await APICalls.addTodo(_taskTxtController.text);
                        _taskTxtController.clear();
                        fetchAllTodos();
                      }

                      // todos.add(Todo(
                      //     todos.length + 1, _taskTxtController.text, false));

                      // setState(() {});
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: IconButton(
                        onPressed: () {
                          todos.removeAt(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete)),
                    onChanged: (v) {
                      //logic to toggle isCompleted
                      todos[index].completed = v!;
                      setState(() {});
                    },
                    value: todos[index].completed,
                    title: Text(todos[index].task!,
                        style: todos[index].completed
                            ? TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Color(0xffff5500),
                              )
                            : TextStyle(fontWeight: FontWeight.w700)),
                  );
                },
              ),
            )
          ],
        ));
  }
}
























// <books>
// <book>
//   <price>600</price>
//   <author>Pata nahi</author>
//   <title>Unjaan</title>
//   <year>600</year>
// </book>
// <book>
//   <price>600</price>
//   <author>Pata nahi</author>
//   <title>Unjaan</title>
//   <year>600</year>
// </book>
// </books>
// {"book": [
// {"title":"Unjaan", "author":"Pata Nahi","price":600,"year":600}
// {"title":"Unjaan", "author":"Pata Nahi","price":600,"year":600}
// ]}




