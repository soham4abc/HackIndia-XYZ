import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:study_helper/notes_fetcher.dart';
import 'package:http/http.dart' as http;
import 'package:study_helper/screens/search_notes.dart';

import '../model/note.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  InputDecoration _inputDecoration(String text) {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      hintText: text,
      contentPadding: const EdgeInsets.all(20.0),
    );
  }

//DIALOG FOR UPDATING NOTE
  Future<void> _showUpdateDeleteNoteDialog(Note note) async {
    _noteBody.text = note.body;
    _noteTitle.text = note.title;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Update the note',
            style: TextStyle(
                fontSize: 25,
                letterSpacing: 1.8,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _noteTitle,
                  decoration: _inputDecoration('Add note title...'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    maxLines: 20,
                    minLines: 15,
                    controller: _noteBody,
                    decoration: _inputDecoration('Add note body...'),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.height * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF44527F),
                ),
                child: const Text(
                  'Delete',
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.8,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () async {
                await deleteNote(note.id);
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
            MaterialButton(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.height * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF44527F),
                ),
                child: const Text(
                  'Update!',
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.8,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () async {
                await updateNote(note.id);
              },
            ),
          ],
        );
      },
    );
  }

//DIALOG FOR ADDING NEW NOTE
  Future<void> _showAddNoteDialog() async {
    _noteBody.text = '';
    _noteTitle.text = '';
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add a new note',
            style: TextStyle(
                fontSize: 25,
                letterSpacing: 1.8,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _noteTitle,
                  decoration: _inputDecoration('Add note title...'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    maxLines: 20,
                    minLines: 15,
                    controller: _noteBody,
                    decoration: _inputDecoration('Add note body...'),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.height * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF44527F),
                ),
                child: const Text(
                  'Add!',
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.8,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () async {
                await addNote();
              },
            ),
          ],
        );
      },
    );
  }

  late final _noteTitle;
  late final _noteBody;
  late final _searchTerm;

  @override
  void initState() {
    super.initState();
    _noteTitle = TextEditingController();
    _noteBody = TextEditingController();
    _searchTerm = TextEditingController();
  }

  @override
  void dispose() {
    _noteTitle.dispose();
    _noteBody.dispose();
    _searchTerm.dispose();
    super.dispose();
  }

//DELETE NOTE FUNCTION
  Future<void> deleteNote(int index) async {
    var box = Hive.box('auth_status');
    String jwt = box.get('auth_status');

    var response = await http.delete(
        Uri.parse('http://notes-backend-service.herokuapp.com/notes/$index'),
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $jwt',
        },
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 404 || response.statusCode == 401) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error deleting the note. Try again.'),
        ),
      );
    }
  }

//UPDATE NOTE FUNCTION
  Future<void> updateNote(int index) async {
    final note = {"title": _noteTitle.text, "content": _noteBody.text};

    var box = Hive.box('auth_status');
    String jwt = box.get('auth_status');

    var response = await http.put(
        Uri.parse('http://notes-backend-service.herokuapp.com/notes/$index'),
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $jwt',
        },
        body: json.encode(note),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error updating the note. Try again.'),
        ),
      );
    }
  }

//ADD NOTE FUNCTION
  Future<void> addNote() async {
    final note = {"title": _noteTitle.text, "content": _noteBody.text};

    var box = Hive.box('auth_status');
    String jwt = box.get('auth_status');

    var response = await http.post(
        Uri.parse(
            'http://notes-backend-service.herokuapp.com/notes?sort_by_update_time=true'),
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $jwt',
        },
        body: json.encode(note),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 201) {
      Navigator.of(context).pop();
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error adding the note. Try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.25, vertical: height * 0.01),
              child: TextField(
                controller: _searchTerm,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.all(25.0),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      await getNotes(_searchTerm.text).then((value) {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => NotesSearch(
                        //       note: value,
                        //     ),
                        //   ),
                        // );
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: getNotes(''),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    var data = (snapshot.data as List<Note>).toList();
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth < 1000) {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.015),
                            child: MasonryGridView.count(
                              itemCount: data.length,
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 4,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () async {
                                      await _showUpdateDeleteNoteDialog(
                                          data[index]);
                                    },
                                    child: NoteCard(data: data, index: index));
                              },
                            ),
                          );
                        } else {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.008),
                            child: MasonryGridView.count(
                              itemCount: data.length,
                              crossAxisCount: 4,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 10,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () async {
                                      await _showUpdateDeleteNoteDialog(
                                          data[index]);
                                    },
                                    child: NoteCard(data: data, index: index));
                              },
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF44527F),
          onPressed: () {
            _showAddNoteDialog();
          },
          child: const Icon(Icons.add),
        ));
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final List<Note> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: index % 2 == 0 ? const Color(0xFFE26873) : const Color(0xFFFAC656),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: ListTile(
          title: Text(data[index].title + '\n',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data[index].body,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                  '\n\nUpdated: ' +
                      data[index].lastUpdtAt +
                      '\nCreated: ' +
                      data[index].crtdAt,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
