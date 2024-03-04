import 'package:booky/book_notes_info.dart';
import 'package:booky/my_book_card_notes.dart';
import 'package:flutter/material.dart';
import 'package:booky/sample_data.dart';



class Notes extends StatefulWidget{
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();

}

class _NotesState extends State<Notes>{
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index){
        return GestureDetector(
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return BookNotesInfo(
                    book:SampleData.allBooks[index],
                  );
                }
                ),
              );
            },
            child: MyBookCardNotes(book: SampleData.allBooks[index])
        );
      },
      separatorBuilder: (context,index){
        return const SizedBox(
          height:8,
        );
      },
      itemCount: SampleData.allBooks.length,
    );
  }
}