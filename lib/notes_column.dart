import 'package:booky/edit_note.dart';
import 'package:booky/note.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';


class BookNotes extends StatefulWidget {
  const BookNotes({Key? key, required this.notes}) : super(key: key);
  final List<Note> notes;

  @override
  State<BookNotes> createState() => _BookNotesState();
}

class _BookNotesState extends State<BookNotes> {

  @override
  Widget build(BuildContext context) {
    List<Widget> noteList = [];

    for (int i = 0; i < widget.notes.length; i++) {
      final note = widget.notes[i];
      noteList.add(
          Card(
          surfaceTintColor: const Color(0xFFDCE2EB),
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(note.name, style: Theme.of(context).textTheme.headlineMedium,),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  EditNote(note: note)));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ExpandableText(
                  note.note,
                  expandText: '... Read more',
                  collapseText: ' Show less',
                  maxLines: 5,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.label),
                    const SizedBox(width: 8),
                    Text(
                      'Page: ${note.page}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: noteList,
    );
  }


}
