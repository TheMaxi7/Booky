import 'package:booky/data_and_classes/book.dart';
import 'package:booky/data_and_classes/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_area/text_area.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key, required this.book});

  final Book book;

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final DataManager manager = DataManager();

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController pageController = TextEditingController();

  void resetFields() {
    setState(() {
      titleController.clear();
      noteController.clear();
      pageController.clear();
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
            "Add new note",
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
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 8),
              child: Text(
                "Note content",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            TextArea(
              borderRadius: 10,
              borderColor: const Color(0xFFCFD6FF),
              textEditingController: noteController,
              onSuffixIconPressed: () => {},
              validation: true,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 8),
              child: TextField(
                controller: pageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF141D29)),
                  ),
                  labelText: 'Page',
                  hintText: 'Enter page number',
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF58595B)),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      pageController.text = '';
                    }
                  });
                },
              ),
            ),
            SizedBox(
              width: ((MediaQuery.of(context).size.width) / 1.5),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    var pageNumber = int.tryParse(pageController.text);
                    final dataManager =
                        Provider.of<DataManager>(context, listen: false);
                    dataManager.addNewNote(widget.book, titleController.text,
                        noteController.text, pageNumber!);
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFF141D29)),
                child: Text(
                  'Add note',
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
