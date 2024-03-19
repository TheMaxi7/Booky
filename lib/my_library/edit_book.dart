import 'package:booky/data_and_classes/book.dart';
import 'package:booky/data_and_classes/data_manager.dart';
import 'package:booky/data_and_classes/shelf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class EditBook extends StatefulWidget {
  const EditBook({super.key, required this.book});

  final Book book;

  @override
  State<EditBook> createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  final DataManager manager = DataManager();
  Shelf selectedShelf = Shelf();
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  late double _value;
  late int _pagesRead;
  double myRate = 0.0;

  void resetFields() {
    setState(() {
      authorController.text = widget.book.author;
      titleController.text = widget.book.name;
    });
  }

  @override
  void initState() {
    super.initState();
    _value = widget.book.pagesRead.toDouble();
    _pagesRead = widget.book.pagesRead;
    authorController.text = widget.book.author;
    titleController.text = widget.book.name;
    myRate = widget.book.myRating;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB),
          title: Text(
            "Edit book",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
              onPressed: resetFields,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF141D29)),
                      ),
                      labelText: 'Title',
                      hintText: widget.book.name,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58595B)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          titleController.text = '';
                        }
                      });
                    },
                  ),
                  TextField(
                    controller: authorController,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF141D29)),
                      ),
                      labelText: 'Author',
                      hintText: widget.book.author,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58595B)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          authorController.text = '';
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8),
                    child: Text(
                      "Shelf",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8),
                    child: DropdownMenu(
                      hintText: findShelf(widget.book).name,
                      dropdownMenuEntries: manager.myShelves.map((shelf) {
                        return DropdownMenuEntry(
                          value: shelf,
                          label: shelf.name,
                        );
                      }).toList(),
                      onSelected: (value) {
                        selectedShelf = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8),
                    child: Text(
                      "Progress",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Slider(
                    min: 0.0,
                    max: widget.book.pages.toDouble(),
                    activeColor: const Color(0xFF141D29),
                    inactiveColor: const Color(0xFF58595B),
                    thumbColor: const Color(0xFFFF4713),
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        _pagesRead = value.toInt();
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pages read: $_pagesRead",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Total pages: ${widget.book.pages}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 8, bottom: 4),
                    child: Text(
                      "Rate",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: widget.book.myRating,
                    itemSize: 32,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color(0xFF141D29),
                    ),
                    onRatingUpdate: (rating) {
                      myRate = rating;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: ((MediaQuery.of(context).size.width) / 1.5),
              child: ElevatedButton(
                onPressed: () {
                  var newTitle = titleController.text;
                  var newAuthor = authorController.text;
                  var oldShelf = findShelf(widget.book);
                  var newShelf = selectedShelf;
                  var newProgress = _pagesRead;
                  var newMyRate = myRate;
                  setState(() {
                    final dataManager =
                        Provider.of<DataManager>(context, listen: false);
                    dataManager.updateBookInfo(widget.book, newTitle, newAuthor,
                        oldShelf, newShelf, newProgress, newMyRate);
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFF141D29)),
                child: Text(
                  'Update',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFFDCE2EB),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Shelf findShelf(Book book) {
    Shelf shelfFound = Shelf();
    for (int i = 0; i < manager.myShelves.length; i++) {
      for (int j = 0; j < manager.myShelves[i].books.length; j++) {
        if (manager.myShelves[i].books[j] == book) {
          shelfFound = manager.myShelves[i];
          break;
        }
      }
    }
    return shelfFound;
  }
}
