import 'package:booky/book.dart';
import 'package:booky/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EditBook extends StatefulWidget {
  const EditBook({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  State<EditBook> createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  final DataManager manager = DataManager();
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  late double _value;
  late int _pagesRead;

  void resetFields() {
    setState(() {
      titleController.clear();
      authorController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _value = widget.book.pagesRead.toDouble();
    _pagesRead = widget.book.pagesRead;
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
                      hintText: 'Select shelf',
                      dropdownMenuEntries: manager.myShelves.map((shelf) {
                        return  DropdownMenuEntry(
                          value: shelf.name,
                          label: shelf.name,
                        );
                      }).toList(),

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
                    initialRating: 3,
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
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ),
            SizedBox(
              width: ((MediaQuery.of(context).size.width) / 1.5),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFF141D29)),
                child: Text(
                  'Update',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: const Color(0xFFDCE2EB)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
