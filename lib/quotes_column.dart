import 'package:booky/data_manager.dart';
import 'package:booky/edit_quote.dart';
import 'package:booky/quote.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookQuotes extends StatefulWidget {
  const BookQuotes({Key? key, required this.quotes}) : super(key: key);
  final List<Quote> quotes;

  @override
  State<BookQuotes> createState() => _BookQuotesState();
}

class _BookQuotesState extends State<BookQuotes> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pinnedNoteList = [];
    List<Widget> unpinnedNoteList = [];

    for (int i = 0; i < widget.quotes.length; i++) {
      final quote = widget.quotes[i];
      final quoteCard = GestureDetector(
        onLongPressStart: (value) {
          _showDropDownMenu(context, value.globalPosition, widget.quotes, quote);
        },
        child: Card(
          surfaceTintColor: const Color(0xFFDCE2EB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: quote.isPinned ? const Color(0xFFFF4713) : const Color(0xFFDCE2EB),
            ),
          ),

          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      quote.name.isNotEmpty ? quote.name : "Quote ${quote.index}:",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditQuote(quote: quote)),
                        );
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

      if (quote.isPinned) {
        pinnedNoteList.add(quoteCard);
      } else {
        unpinnedNoteList.add(quoteCard);
      }
    }

    return Column(
      children: [
        ...pinnedNoteList,
        ...unpinnedNoteList,
      ],
    );
  }

  void _showDropDownMenu(BuildContext context, Offset offset, List<Quote> quotes, Quote quote) {
    final RenderObject overlay = Overlay.of(context).context.findRenderObject()!;

    showMenu(
      context: context,
      items: [
        PopupMenuItem(
          child: const Row(children: [
            Icon(Icons.push_pin),
            SizedBox(width: 16),
            Text('Pin')
          ]),
          onTap: () {
            setState(() {
              final dataManager = Provider.of<DataManager>(context, listen: false);
              dataManager.pinQuote(quotes, quote);
            });
          },
        ),
        PopupMenuItem(
          child: const Row(children: [
            Icon(Icons.delete),
            SizedBox(width: 16),
            Text('Delete')
          ]),
          onTap: () {
            setState(() {
              final dataManager = Provider.of<DataManager>(context, listen: false);
              dataManager.deleteQuote(quotes, quote);
            });
          },
        ),
      ],
      position: RelativeRect.fromRect(
        Rect.fromLTWH(offset.dx, offset.dy, 30, 30),
        Rect.fromLTWH(
          0,
          0,
          overlay.paintBounds.size.width,
          overlay.paintBounds.size.height,
        ),
      ),
    );
  }
}

