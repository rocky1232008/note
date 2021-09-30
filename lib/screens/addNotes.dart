import 'package:flutter/material.dart';
import 'package:notes/helpers/DataBaseFuncs.dart';

import 'home.dart';

class addNotes extends StatefulWidget {
  const addNotes({ Key? key , required this.db}) : super(key: key);

  final DataFuncs db;

  @override
  _addNotesState createState() => _addNotesState();
}

class _addNotesState extends State<addNotes> {
  String? note, title, date, author, tags;
  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        backgroundColor: Colors.orange,
        elevation: 10,
        shadowColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 0),
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.deepOrange)),
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.orange),
                    hoverColor: Colors.deepOrange),
                    onChanged: (cxt){
                      title = cxt;
                    },

                    ),
                    SizedBox(
                      height: 20,
                    ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.deepOrange)),
                  hintText: 'Note',
                  hintStyle: TextStyle(color: Colors.orange),
                  hoverColor: Colors.deepOrange),
              maxLines: 15,
              onChanged: (ctx){
                note = ctx;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.deepOrange)),
                    hintText: 'Tags',
                    hintStyle: TextStyle(color: Colors.orange),
                    hoverColor: Colors.deepOrange),
                    onChanged: (ctx){
                      tags = ctx;
                    },
                    ),
                    SizedBox(
                      height: 20,
                    ),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.deepOrange)),
                    hintText: 'Author',
                    hintStyle: TextStyle(color: Colors.orange),
                    hoverColor: Colors.deepOrange),
                    onChanged: (ctx){
                      author = ctx;
                    },
                    ),
                    SizedBox(
                      height: 20,
                    ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));}, child: Text('Cancel', style: TextStyle(color: Colors.deepOrange),), style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 23), backgroundColor: Colors.orange),),
                  TextButton(onPressed: () {
                    saveNote();
                    Navigator.pop(context);
                    }, child: Text('Save', style: TextStyle(color: Colors.deepOrange),), style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 23), backgroundColor: Colors.orange),),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
  
  void saveNote(){
    if(note != null && title != null && tags != null && author != null){
      widget.db.addNoteLocal(note.toString(), author.toString(), title.toString(), tags.toString());
  }
}
}