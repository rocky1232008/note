import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'helpers/notesModel.dart';

class Boxes{
  static Box<NotesModel> getNotesBox() => Hive.box('notesBoX');
}