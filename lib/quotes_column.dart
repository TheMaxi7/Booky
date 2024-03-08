import 'package:booky/quote.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';


  class BookQuotes extends StatelessWidget {
  final List<Quote> quotes;

  const BookQuotes({Key? key, required this.quotes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> noteList = [];

    for (int i = 0; i < quotes.length; i++) {
      final quote = quotes[i];
      noteList.add(
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Quote ${quote.index.toString()}'),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'edit',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ExpandableText(
                  quote.quote,
                  expandText: '... Read more',
                  collapseText: ' Show less',
                  maxLines: 5,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.label),
                    const SizedBox(width: 8),
                    Text(
                      'Page: ${quote.page}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: noteList,
    );
  }
}
