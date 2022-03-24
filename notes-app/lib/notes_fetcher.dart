import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'model/note.dart';

import 'package:http/http.dart' as http;

Future<List<Note>> getNotes() async {
  var box = Hive.box('auth_status');
  String jwt = box.get('auth_status');
  final response = await http.get(
      Uri.parse('http://notes-backend-service.herokuapp.com/notes'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      });

  var body = json.decode(response.body);

  List<Note> notes = [];

  for (int i = 0; i < body.length; i++) {
    Note note = Note(
      id: body[i]['id'],
      title: body[i]['title'],
      body: body[i]['content'],
      lastUpdtAt: body[i]['last_updated_at'],
      crtdAt: body[i]['user']['created_at'],
    );
    notes.add(note);
  }

  return notes;
}
