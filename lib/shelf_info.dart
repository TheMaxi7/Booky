import 'package:booky/book_info.dart';
import 'package:booky/explore.dart';
import 'package:booky/shelf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_manager.dart';

class ShelfInfo extends StatefulWidget {
  const ShelfInfo({Key? key, required this.shelf}) : super(key: key);

  final Shelf shelf;

  @override
  State<ShelfInfo> createState() => _ShelfInfoState();
}

class _ShelfInfoState extends State<ShelfInfo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFDCE2EB),
            title: Text(
              widget.shelf.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.40,
                  ),
                  itemCount: widget.shelf.books.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookInfo(book:widget.shelf.books[index])));

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage(widget.shelf.books[index].cover),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
