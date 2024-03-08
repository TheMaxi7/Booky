import 'package:booky/book.dart';

import 'package:booky/quotes_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';

class QuotesTab extends StatefulWidget {
  final Book book;
  const QuotesTab({super.key, required this.book});

  @override
  State<QuotesTab> createState() => _QuotesTabState();
}

class _QuotesTabState extends State<QuotesTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return BookQuotes(quotes: widget.book.quotes);
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

