import 'package:booky/book.dart';
import 'package:flutter/material.dart';

class BookNotesInfo extends StatefulWidget{
  const BookNotesInfo({super.key, required this.book});

  final Book book;
  @override
  State<BookNotesInfo> createState() => _BookNotesInfoState();

}

class _BookNotesInfoState extends State<BookNotesInfo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB) ,
          title: Text(widget.book.name,style: const TextStyle(color: Color(0xFF141D29))),
        ),
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.book.cover),
                    fit: BoxFit.fill,
                  )
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                  "Description"
              ),
            ),
          ],
        )
    );
  }
}