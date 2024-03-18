import 'package:booky/data_and_classes/data_manager.dart';
import 'package:booky/data_and_classes/note.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_area/text_area.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});

  final Note note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final DataManager manager = DataManager();
  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController pageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.note.name;
    contentController.text = widget.note.note;
    pageController.text = widget.note.page.toString();
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
            "Edit note",
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
                      "Note name",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF141D29)),
                      ),
                      hintText: 'Enter note name',
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
                      "Note content",
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
                      "Note page",
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
                    dataManager.updateNote(
                      widget.note,
                      nameController.text,
                      contentController.text,
                      page,
                    );
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
