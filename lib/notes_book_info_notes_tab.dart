import 'package:booky/book.dart';
import 'package:booky/notes_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';

class NotesTab extends StatefulWidget {
  final Book book;
  const NotesTab({super.key, required this.book});

  @override
  State<NotesTab> createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return BookNotes(notes: widget.book.notes);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: 1,
        );
      },

    );
  }
}

