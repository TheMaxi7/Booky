import 'package:booky/edit_quote.dart';
import 'package:booky/quote.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';


class BookQuotes extends StatefulWidget {
  const BookQuotes({Key? key, required this.quotes}) : super(key: key);
  final List<Quote> quotes;

  @override
  State<BookQuotes> createState() => _BookQuotesState();
}

class _BookQuotesState extends State<BookQuotes> {

  @override
  Widget build(BuildContext context) {
    List<Widget> noteList = [];

    for (int i = 0; i < widget.quotes.length; i++) {
      final quote = widget.quotes[i];
      noteList.add(
        Card(
          surfaceTintColor: const Color(0xFFDCE2EB),
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(quote.name.toString(),style: Theme.of(context).textTheme.headlineMedium,),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  EditQuote(quote: quote)));
                      },
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
