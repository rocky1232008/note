
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/helpers/notesModel.dart';
import 'package:notes/helpers/DataBaseFuncs.dart';
import 'package:notes/main.dart';
import 'package:notes/screens/view_Notes.dart';

Widget buildContent(List<NotesModel> notesModel, DataFuncs db){
  return Column(children: [
    notesModel.length > 0 ? Expanded(child: ListView.builder(itemCount: notesModel.length,itemBuilder: (BuildContext context, int index){
      final notes = notesModel[index];
      return buildNotesTile(context, db, notes);
    },))
    : Column(),
  ],);
}

Widget buildNotesTile(BuildContext context, DataFuncs db, NotesModel notes){
  final date = DateFormat.yMMMd().format(notes.createdDate);
  return Card(child: ListTile(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => viewNotes(note: notes, db: db)));
    },
    title: Text(notes.title),
    trailing: IconButton(icon: Icon(Icons.delete), onPressed: (){db.removeNoteLocal(notes);},),
    subtitle: Text('Tags: ' + notes.tag + ', Date: ' + date),
  ),);
}