// //could not implement due to time constraints

// import 'package:flutter/material.dart';

// import '../model/note.dart';

// class NotesSearch extends StatelessWidget {
//   const NotesSearch({Key? key, required this.note}) : super(key: key);

//   final List<Note> note;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search Results'),
//       ),
//       body: LayoutBuilder(
//                       builder: (context, constraints) {
//                         if (constraints.maxWidth < 1000) {
//                           return Padding(
//                             padding:
//                                 EdgeInsets.symmetric(horizontal: width * 0.015),
//                             child: MasonryGridView.count(
//                               itemCount: data.length,
//                               crossAxisCount: 2,
//                               mainAxisSpacing: 2,
//                               crossAxisSpacing: 4,
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                     onTap: () async {
//                                       await _showUpdateDeleteNoteDialog(
//                                           data[index]);
//                                     },
//                                     child: NoteCard(data: data, index: index));
//                               },
//                             ),
//                           );
//                         } else {
//                           return Padding(
//                             padding:
//                                 EdgeInsets.symmetric(horizontal: width * 0.008),
//                             child: MasonryGridView.count(
//                               itemCount: data.length,
//                               crossAxisCount: 4,
//                               mainAxisSpacing: 4,
//                               crossAxisSpacing: 10,
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                     onTap: () async {
//                                       await _showUpdateDeleteNoteDialog(
//                                           data[index]);
//                                     },
//                                     child: NoteCard(data: data, index: index));
//                               },
//                             ),
//                           );
//                         }
//                       },
//                     )
//     );
//   }
// }
