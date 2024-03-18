import 'package:flutter/material.dart';
import 'package:booky/data_and_classes/data_manager.dart';
import 'package:provider/provider.dart';
import 'package:booky/notes/notes_book_card.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return NotesBookCard(book: manager.myBooks[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: manager.myBooks.length,
        );
      },
    );
  }
}
