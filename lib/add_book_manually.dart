import 'package:flutter/material.dart';

class AddBookManually extends StatefulWidget {
  const AddBookManually({Key? key}) : super(key: key);

  @override
  State<AddBookManually> createState() => _AddBookManuallyState();
}

class _AddBookManuallyState extends State<AddBookManually> {
  TextEditingController genreController = TextEditingController();
  TextEditingController shelfController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController isbnController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  void resetFields() {
    setState(() {
      shelfController.clear();
      pagesController.clear();
      genreController.clear();
      isbnController.clear();
      titleController.clear();
      authorController.clear();
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
              height: (MediaQuery.of(context).size.width) /
                  2.1 *
                  1.51, // Set the height you desire
              color: Colors.grey, // You can set any color or decoration here
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
            TextField(
              controller: shelfController,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleMedium,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF141D29)),
                ),
                labelText: 'Shelf',
                hintText: 'Enter author',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF58595B)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    shelfController.text = '';
                  }
                });
              },
            ),
            TextField(
              controller: shelfController,
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
                    shelfController.text = '';
                  }
                });
              },
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
