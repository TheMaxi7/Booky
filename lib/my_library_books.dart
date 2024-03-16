import 'package:booky/filters_list.dart';
import 'package:booky/my_book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';

class MyLibraryBooks extends StatefulWidget {
  const MyLibraryBooks({Key? key}) : super(key: key);

  @override
  State<MyLibraryBooks> createState() => _MyLibraryBooksState();
}

class _MyLibraryBooksState extends State<MyLibraryBooks> {
  late bool _sortAscending;
  @override
  void initState() {
    super.initState();
    _sortAscending = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FiltersList()
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF58595B)),
                      ),
                      icon: const Icon(
                        Icons.filter_alt_sharp,
                        color: Color(0xFF58595B),
                      ),
                      label: Text('Filter',
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          final dataManager =
                          Provider.of<DataManager>(context, listen: false);
                          _sortAscending = !_sortAscending;
                          if (_sortAscending) {
                            dataManager.sortBooksAZ();
                          } else {
                            dataManager.sortBooksZA();
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF58595B)),
                      ),
                      icon: const Icon(Icons.sort, color: Color(0xFF58595B)),
                      label: Text(
                        _sortAscending ? 'Sort A-Z' : 'Sort Z-A',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              final bookIndex = index - 1;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: MyBookCard(book: manager.myBooks[bookIndex]),
              );
            }
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: manager.myBooks.length + 1,
        );
      },
    );
  }
}
