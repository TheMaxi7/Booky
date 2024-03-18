import 'package:booky/data_and_classes/data_manager.dart';
import 'package:booky/data_and_classes/shelf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBookManually extends StatefulWidget {
  const AddBookManually({super.key});

  @override
  State<AddBookManually> createState() => _AddBookManuallyState();
}

class _AddBookManuallyState extends State<AddBookManually> {
  final DataManager manager = DataManager();
  Shelf selectedShelf = Shelf();
  TextEditingController genreController = TextEditingController();
  TextEditingController shelfController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController isbnController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void resetFields() {
    setState(() {
      shelfController.clear();
      pagesController.clear();
      genreController.clear();
      isbnController.clear();
      titleController.clear();
      authorController.clear();
      descriptionController.clear();
    });
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
            "Add new book",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
              onPressed: resetFields,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Container(
              width: (MediaQuery.of(context).size.width) / 2.1,
              height: (MediaQuery.of(context).size.width) / 2.1 * 1.51,
              color: Colors.grey,
              child: const Center(
                child: Text(
                  'Upload Picture',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleMedium,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF141D29)),
                ),
                labelText: 'Title',
                hintText: 'Enter title',
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
                hintText: 'Enter author',
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
            TextField(
              controller: genreController,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleMedium,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF141D29)),
                ),
                labelText: 'Genre',
                hintText: 'Enter genre',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF58595B)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    genreController.text = '';
                  }
                });
              },
            ),
            TextField(
              controller: pagesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleMedium,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF141D29)),
                ),
                labelText: 'Pages',
                hintText: 'Enter pages',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF58595B)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    pagesController.text = '';
                  }
                });
              },
            ),
            TextField(
              controller: isbnController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleMedium,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF141D29)),
                ),
                labelText: 'ISBN',
                hintText: 'Enter ISBN',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF58595B)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    isbnController.text = '';
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
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleMedium,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF141D29)),
                ),
                labelText: 'Book description',
                hintText: 'Enter description',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF58595B)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    descriptionController.text = '';
                  }
                });
              },
            ),
            SizedBox(
              width: ((MediaQuery.of(context).size.width) / 1.5),
              child: ElevatedButton(
                onPressed: () {
                  var title = titleController.text;
                  var author = authorController.text;
                  var genre = genreController.text;
                  var pages = int.parse(pagesController.text);
                  var isbn = int.parse(isbnController.text);
                  var shelf = selectedShelf;
                  var description = descriptionController.text;
                  setState(() {
                    final dataManager =
                        Provider.of<DataManager>(context, listen: false);
                    dataManager.addBookManually(
                        title, author, genre, pages, isbn, shelf, description);
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFF141D29)),
                child: Text(
                  'Add book',
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
