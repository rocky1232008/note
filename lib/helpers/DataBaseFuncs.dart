import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:notes/screens/home.dart';
import 'notesModel.dart';
import 'package:notes/boxes.dart';

class DataFuncs{
  //add new note
  Future addNoteLocal(String noteString, String author, String Title, String Tags) async {
    final createdDate = DateTime.now();
    final note = NotesModel(Tags, Title, author, createdDate, noteString);

    final box = Boxes.getNotesBox();
    box.add(note);
  }

  editNoteLocal(NotesModel notesModel, String note, String Title, String Tag, String author){
    notesModel.tag = Tag;
    notesModel.title = Title;
    notesModel.author = author;
    notesModel.note = note;

    notesModel.save();
  }

  removeNoteLocal(NotesModel notesModel){
    notesModel.delete();
  }
}