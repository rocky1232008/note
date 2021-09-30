import 'package:flutter/material.dart';
import 'package:notes/helpers/DataBaseFuncs.dart';
import 'package:notes/helpers/notesModel.dart';
import 'package:notes/screens/view_Notes.dart';

import 'home.dart';

class editNotes extends StatefulWidget {
  const editNotes({Key? key, required this.note, required this.db}) : super(key: key);

  final NotesModel note;
  final DataFuncs db;

  @override
  _editNotesState createState() => _editNotesState();
}

class _editNotesState extends State<editNotes> {
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController author = TextEditingController();

  editNotes(){
    if(title != null && note != null && tags != null && author != null){
      widget.db.editNoteLocal(widget.note, note.text, title.text, tags.text, author.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => viewNotes(note: widget.note, db: widget.db)));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please make sure all of the fields are filled out.'), duration: Duration(microseconds: 1000),));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    title.text = widget.note.title;
    note.text = widget.note.note;
    tags.text = widget.note.tag;
    author.text = widget.note.author;
    super.initState();
  }

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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  hintText: 'Title',
                  hintStyle: TextStyle(color: Colors.orange),
                  hoverColor: Colors.deepOrange),
              controller: title,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  hintText: 'Note',
                  hintStyle: TextStyle(color: Colors.orange),
                  hoverColor: Colors.deepOrange),
              maxLines: 15,
              controller: note,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  hintText: 'Tags',
                  hintStyle: TextStyle(color: Colors.orange),
                  hoverColor: Colors.deepOrange),
              controller: tags,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  hintText: 'Author',
                  hintStyle: TextStyle(color: Colors.orange),
                  hoverColor: Colors.deepOrange),
              controller: author,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 23),
                        backgroundColor: Colors.orange),
                  ),
                  TextButton(
                    onPressed: () {
                      editNotes();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 23),
                        backgroundColor: Colors.orange),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
