import 'package:hive/hive.dart';

part 'notesModel.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject{
  @HiveField(0)
  late String title;

  @HiveField(1)
  late DateTime createdDate;

  @HiveField(2)
  late String note;

  @HiveField(3)
  late String tag;

  @HiveField(4)
  late String author;

  NotesModel(this.tag, this.title, this.author, this.createdDate, this.note);
}