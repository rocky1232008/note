import 'package:flutter/material.dart';
import 'package:notes/helpers/notesModel.dart';
import 'package:notes/screens/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await  Hive.openBox<NotesModel>('notesBoX');
  runApp(Notes());
}

class Notes extends StatelessWidget {
  const Notes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}