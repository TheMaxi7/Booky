import 'package:booky/book.dart';
import 'package:booky/my_book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';

class FilteredBookList extends StatefulWidget {
  const FilteredBookList({Key? key, required this.filteredList}) : super(key: key);
  final List<Book> filteredList;
  @override
  State<FilteredBookList> createState() => _FilteredBookListState();
}

class _FilteredBookListState extends State<FilteredBookList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(builder: (context, manager, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB),
          title: Text("Filtered books",
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
                    child: MyBookCard(book: widget.filteredList[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: widget.filteredList.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
