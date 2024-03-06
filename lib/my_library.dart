import 'package:booky/book_info.dart';
import 'package:booky/my_book_card.dart';
import 'package:flutter/material.dart';
import 'package:booky/sample_data.dart';


class MyLibrary extends StatefulWidget{
  const MyLibrary({super.key});

  @override
  State<MyLibrary> createState() => _MyLibraryState();

}

class _MyLibraryState extends State<MyLibrary> {
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF58595B)),
                  ),
                  icon: const Icon(Icons.filter_alt_sharp, color: Color(0xFF58595B)),
                  label: Text('Filter', style: Theme.of(context).textTheme.bodySmall),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _sortAscending = !_sortAscending;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF58595B)),
                  ),
                  icon: const Icon(Icons.sort, color: Color(0xFF58595B)),
                  label: Text(_sortAscending ? 'Sort A-Z' : 'Sort Z-A', style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
          );
        } else {
          final bookIndex = index - 1;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BookInfo(
                      book: SampleData.allBooks[bookIndex],
                    );
                  },
                ),
              );
            },
            child: MyBookCard(book: SampleData.allBooks[bookIndex]),
          );
        }
      },
      separatorBuilder: (context, index) {

        return const SizedBox(
          height: 8,
        );
      },
      itemCount: SampleData.allBooks.length + 1,
    );
  }
}
