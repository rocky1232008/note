import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/boxes.dart';
import 'package:notes/helpers/DataBaseFuncs.dart';
import 'package:notes/helpers/data.dart';
import 'package:notes/helpers/notesModel.dart';
import 'package:notes/screens/addNotes.dart';
import 'package:notes/widgets/widgets.dart';
import 'view_Notes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DataFuncs db = DataFuncs();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        elevation: 10,
        shadowColor: Colors.deepOrange,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
        ],
      ),
      body: ValueListenableBuilder<Box<NotesModel>>(valueListenable: Boxes.getNotesBox().listenable(), builder: (context, box, _){
        final notes = box.values.toList().cast<NotesModel>();

        return buildContent(notes, db);
      },),
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => addNotes(db: db)));}, child: Icon(Icons.add),),
    );
  }
}
