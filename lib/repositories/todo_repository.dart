import 'dart:convert';

import 'package:flutter_application_todo_list/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const todoListKey = 'todo_list';

class TodoRepository {

    late SharedPreferences sharedPreferences;

    Future<List<Todo>> getTodoList () async {
      sharedPreferences = await SharedPreferences.getInstance();

      // ignore: unused_local_variable
      final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';

      final jsonDecoded = json.decode(jsonString) as List;

      return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
    }

    void saveTodoList(List<Todo> todos){
      final jsonString = json.encode(todos);
      sharedPreferences.setString(todoListKey, jsonString);
    }
  
}