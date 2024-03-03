import 'package:booky/book.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatefulWidget{
  const BookInfo({super.key, required this.book});

  final Book book;
  @override
  State<BookInfo> createState() => _BookInfoState();

}

class _BookInfoState extends State<BookInfo>{
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