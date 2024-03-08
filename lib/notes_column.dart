import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'note.dart';

class BookNotes extends StatelessWidget {
  final List<Note> notes;

  const BookNotes({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> noteList = [];

    for (int i = 0; i < notes.length; i++) {
      final note = notes[i];
      noteList.add(
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Note ${note.index.toString()}'),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'edit',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
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
