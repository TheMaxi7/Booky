import 'package:flutter/material.dart';
import 'sample_data.dart';
import 'package:booky/book.dart';

class MyBookCard extends StatefulWidget{
  const MyBookCard({super.key, required this.book});

  final Book book;

  @override
  State<MyBookCard> createState() => _MyBookCardState();

}

class _MyBookCardState extends State<MyBookCard>{
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width)/2,
            height: 200,
            decoration: BoxDecoration(

              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(widget.book.cover),
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Text(
              widget.book.name,
            ),
          ),
        ],
      ),
    );

  }
}