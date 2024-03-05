import 'package:booky/book_info.dart';
import 'package:booky/my_book_card.dart';
import 'package:flutter/material.dart';
import 'package:booky/sample_data.dart';

class MyLibrary extends StatefulWidget {
  const MyLibrary({Key? key}) : super(key: key);

  @override
  State<MyLibrary> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Text('My Library', style: Theme.of(context).textTheme.headline6),
        bottom: const TabBar(
          dividerColor: Color(0xFFDCE2EB),
          tabs: [
            Tab(text: "Books"),
            Tab(text: "Shelves"),
            Tab(text: "Wishlist"),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                height: 15,
                color: Colors.blue,
              ),
            ),
            const Text("Child1"),
            const Divider(),
            const Text("Child2"),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: SampleData.allBooks.length + 1, // +1 for buttons
        itemBuilder: (context, index) {
          if (index == 0) {
            // This is where the buttons will be displayed
            return Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF58595B)),
                    ),
                    icon: const Icon(Icons.filter_alt_sharp, color: Color(0xFF58595B),),
                    label: Text('Filter', style: Theme.of(context).textTheme.bodyText2,),
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
                    icon: const Icon(Icons.sort, color: Color(0xFF58595B),),
                    label: Text(_sortAscending ? 'Sort A-Z' : 'Sort Z-A', style: Theme.of(context).textTheme.bodyText2,),
                  ),
                ],
              ),
            );
          } else {
            // These are the book items
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
      ),
    );
  }
}
