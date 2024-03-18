import 'package:booky/data_and_classes/book.dart';
import 'package:booky/data_and_classes/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_area/text_area.dart';

class NewQuote extends StatefulWidget {
  const NewQuote({super.key, required this.book});

  final Book book;

  @override
  State<NewQuote> createState() => _NewQuoteState();
}

class _NewQuoteState extends State<NewQuote> {
  final DataManager manager = DataManager();
  bool _isFavourite = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController quoteController = TextEditingController();
  TextEditingController pageController = TextEditingController();

  void resetFields() {
    setState(() {
      titleController.clear();
      quoteController.clear();
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
            "Add new quote",
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
                "Quote content",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            TextArea(
              borderRadius: 10,
              borderColor: const Color(0xFFCFD6FF),
              textEditingController: quoteController,
              onSuffixIconPressed: () => {},
              validation: true,
            ),
            TextField(
              controller: pageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleMedium,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF141D29)),
                ),
                labelText: 'Page',
                hintText: 'Enter page',
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
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 8),
              child: Row(
                children: [
                  Text(
                    "Favourite",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Checkbox(
                    value: _isFavourite, //
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isFavourite = newValue ?? false;
                      });
                    },
                  ),
                ],
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
                    dataManager.addNewQuote(widget.book, titleController.text,
                        quoteController.text, pageNumber!, _isFavourite);
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFF141D29)),
                child: Text(
                  'Add quote',
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
