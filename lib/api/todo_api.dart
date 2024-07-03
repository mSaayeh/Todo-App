import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/models/todo.dart';

const String BASE_URL = "https://jsonplaceholder.typicode.com";

class TodoApi {
  Future<List<Todo>> getAllTodos() async {
    try {
      const String url = "$BASE_URL/todos";
      final response = await http.get(Uri.parse(url));

      List<Todo> todos = json
          .decode(response.body)
          .map<Todo>((todoJson) => Todo.fromJson(todoJson))
          .toList();

      return todos;
    } catch (e) {
      rethrow;
    }
  }
}
