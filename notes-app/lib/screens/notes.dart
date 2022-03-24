import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:study_helper/notes_fetcher.dart';
import 'package:http/http.dart' as http;

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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
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
                  'Cancel',
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.8,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
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
                  'Add!',
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.8,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () async{
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

  @override
  void initState() {
    super.initState();
    _noteTitle = TextEditingController();
    _noteBody = TextEditingController();
  }

  @override
  void dispose() {
    _noteTitle.dispose();
    _noteBody.dispose();
    super.dispose();
  }

  Future<void> addNote() async {
    final note = {"title": _noteTitle.text, "content": _noteBody.text};

    var box = Hive.box('auth_status');
    String jwt = box.get('auth_status');

    var response = await http.post(
        Uri.parse('http://notes-backend-service.herokuapp.com/notes'),
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
                  horizontal: width * 0.3, vertical: height * 0.01),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.all(25.0),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    //TODO: Search functionality
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: getNotes(),
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
                                return NoteCard(data: data, index: index);
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
                                return NoteCard(data: data, index: index);
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
            _showMyDialog();
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
              Text(data[index].body,
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
              Text('\n\nUpdated: ' + data[index].lastUpdtAt + '\nCreated: ' + data[index].crtdAt,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
