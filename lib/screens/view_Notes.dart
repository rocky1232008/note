import 'package:flutter/material.dart';
import 'package:notes/helpers/DataBaseFuncs.dart';
import 'package:notes/helpers/data.dart';
import 'package:notes/helpers/notesModel.dart';
import 'package:notes/main.dart';
import 'package:notes/screens/editNote.dart';

import 'home.dart';

class viewNotes extends StatefulWidget {
  
  const viewNotes({ Key? key , required this.note, required this.db}) : super(key: key);

  final DataFuncs db;
  final NotesModel note;

  @override
  _viewNotesState createState() => _viewNotesState();
}

class _viewNotesState extends State<viewNotes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note: " + widget.note.title),
        backgroundColor: Colors.orange, elevation: 10, 
        shadowColor: Colors.deepOrange,
        actions: [
          IconButton(onPressed: (){
            widget.db.removeNoteLocal(widget.note);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
          }, icon: Icon(Icons.delete)),
          IconButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => editNotes(note: widget.note, db: widget.db)));}, icon: Icon(Icons.edit))
        ],
        ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(border: Border.all(
              color: Colors.deepOrange,
            ), borderRadius: BorderRadius.circular(35)),
            child: Text("Text: ${widget.note.note}")
          )
        ],),
      ),
    );
  }
}