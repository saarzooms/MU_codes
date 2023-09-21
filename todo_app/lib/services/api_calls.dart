import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/model/todo.dart';

class APICalls {
  static addTodo(String task) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));
    request.body = json
        .encode({"id": DateTime.now().millisecondsSinceEpoch, "task": task});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static fetchTodos() async {
    List<TodoList> todos = [];
    http.Response response = await http
        .get(Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));
    if (response.statusCode == 200) {
      print(response.body);
      todos = todoListFromJson(response.body.toString());
    }
    print(todos.length);
    return todos;
  }

  static updateTodo(int id, bool isCompleted) async {
    var headers = {'Content-Type': 'application/json'};
    http.Response response = await http.put(
        Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/$id'),
        body: json.encode({"completed": isCompleted}),
        headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
