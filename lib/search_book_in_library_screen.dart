import 'package:flutter/material.dart';

class SearchBookInLibrary extends StatefulWidget {
  const SearchBookInLibrary({Key? key}) : super(key: key);

  @override
  State<SearchBookInLibrary> createState() => _SearchBookInLibraryState();
}

class _SearchBookInLibraryState extends State<SearchBookInLibrary> {
  TextEditingController keywordController = TextEditingController();
  TextEditingController isbnController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  void resetFields() {
    setState(() {
      keywordController.clear();
      isbnController.clear();
      titleController.clear();
      authorController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapped outside of text fields
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB),
          title: Text(
            "Search in library",
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
                  Text("Fast search", style: Theme.of(context).textTheme.titleMedium,),
                  TextField(
                    controller: keywordController,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF141D29)),
                      ),
                      labelText: 'Keyword',
                      hintText: 'Enter keyword',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58595B)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          keywordController.text = '';
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 40),
                  Text("More detailed search", style: Theme.of(context).textTheme.titleMedium,),
                  TextField(
                    controller: isbnController,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    controller: titleController,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF141D29)),
                      ),
                      labelText: 'Title',
                      hintText: 'Enter book title',
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
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF141D29)),
                      ),
                      labelText: 'Author',
                      hintText: 'Enter Author',
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

                ],
              ),
            ),
            SizedBox(
              width: ((MediaQuery.of(context).size.width)/1.5),
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                side: const BorderSide(color: Color(0xFF58595B)),
                backgroundColor: const Color(0xFF141D29)),
                child: Text('Search', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xFFDCE2EB)),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
