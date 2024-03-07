
import 'package:booky/explore_book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';
import 'book_info.dart';

class Explore extends StatefulWidget {
  const Explore({
    Key? key,
  }) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  // double computeHeight() {
  //   double height = MediaQuery.of(context).size.height;
  //   var padding = MediaQuery.of(context).viewPadding;
  //   double safeHeight = height - padding.top - kToolbarHeight;
  //   return safeHeight;
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: DropdownButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      hint: const Text("All categories"),
                      items: const [
                        DropdownMenuItem(
                            value: "ciao",
                            child: Text("ciao")
                        ),
                        DropdownMenuItem(
                            value: "ciao",
                            child: Text("ciao")
                        ),
                      ],
                      onChanged: (value) {  },
                    ),
                  ),
                  Text("Bestsellers",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8),
                      itemCount: manager.allBooks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BookInfo(
                                      book: manager.allBooks[index]);
                                },
                              ),
                            );
                          },
                          child: ExploreBookCard(book: manager.allBooks[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New releases",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 180,
                    child: manager.allBooks.isEmpty ? Text("You have no favourite recipes",
                        style: Theme.of(context).textTheme.bodyLarge) : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8),
                      itemCount: manager.allBooks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BookInfo(
                                      book: manager.allBooks[index]);
                                },
                              ),
                            );
                          },
                          child:
                          ExploreBookCard(book: manager.allBooks[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("For you",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8),
                      itemCount: manager.allBooks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BookInfo(
                                      book: manager.allBooks[index]);
                                },
                              ),
                            );
                          },
                          child: ExploreBookCard(book: manager.allBooks[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
