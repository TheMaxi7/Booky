import 'package:booky/book_notes_info.dart';
import 'package:booky/data_manager.dart';
import 'package:booky/my_book_card_notes.dart';
import 'package:flutter/material.dart';
import 'package:booky/sample_data.dart';
import 'package:provider/provider.dart';



class Notes extends StatefulWidget{
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
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return BookNotesInfo(
                          book: manager.myBooks[index],
                        );
                      }
                      ),
                    );
                  },
                  child: MyBookCardNotes(book: manager.myBooks[index])
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemCount: manager.myBooks.length,
          );
        }
    );
  }
}