import 'package:booky/data_and_classes/book.dart';
import 'package:booky/my_library/my_book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_and_classes/data_manager.dart';

class SearchInBooks extends StatefulWidget {
  const SearchInBooks(
      {super.key, required this.searchList, required this.searchString});

  final List<Book> searchList;
  final String searchString;

  @override
  State<SearchInBooks> createState() => _SearchInBooksState();
}

class _SearchInBooksState extends State<SearchInBooks> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(builder: (context, manager, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB),
          title: Text("Search results for \"${widget.searchString}\"",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: MyBookCard(book: widget.searchList[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: widget.searchList.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
