import 'package:booky/book_info.dart';
import 'package:booky/my_book_card.dart';
import 'package:flutter/material.dart';
import 'package:booky/sample_data.dart';



class BookColumn extends StatefulWidget{
  const BookColumn({super.key});

  @override
  State<BookColumn> createState() => _BookColumnState();

}

class _BookColumnState extends State<BookColumn>{
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index){
          return GestureDetector(
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return BookInfo(
                    book:SampleData.allBooks[index],
                  );
                }
                ),
              );
            },
            child: MyBookCard(book: SampleData.allBooks[index])
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