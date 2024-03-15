import 'package:booky/book.dart';
import 'package:booky/data_manager.dart';
import 'package:booky/note.dart';
import 'package:booky/quote.dart';
import 'package:booky/shelf.dart';
import 'package:booky/standard_challenges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:text_area/text_area.dart';

class EditQuote extends StatefulWidget {
  const EditQuote({Key? key, required this.quote}) : super(key: key);

  final Quote quote;

  @override
  State<EditQuote> createState() => _EditQuoteState();
}

class _EditQuoteState extends State<EditQuote> {
  final DataManager manager = DataManager();
  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController pageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.quote.name;
    contentController.text = widget.quote.quote;
    pageController.text = widget.quote.page.toString();

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
            "Edit quote",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8),
                    child: Text(
                      "Quote name",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF141D29)),
                      ),
                      hintText: 'Enter quote name',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58595B)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          nameController.text = '';
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
                    textEditingController: contentController,
                    onSuffixIconPressed: () => {},
                    validation: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8),
                    child: Text(
                      "Quote page",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
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
                      hintText: 'Enter note page',
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
                ],
              ),
            ),

            SizedBox(
              width: ((MediaQuery.of(context).size.width) / 1.5),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    int page = int.tryParse(pageController.text) ?? 0;
                    final dataManager =
                    Provider.of<DataManager>(context, listen: false);
                    dataManager.updateQuote(
                      widget.quote, nameController.text, contentController.text, page, );
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFF141D29)),
                child: Text(
                  'Save',
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
