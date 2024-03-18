import 'package:booky/data_and_classes/shelf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_and_classes/data_manager.dart';

class AddNewShelf extends StatefulWidget {
  const AddNewShelf({super.key});

  @override
  State<AddNewShelf> createState() => _AddNewShelfState();
}

class _AddNewShelfState extends State<AddNewShelf> {
  TextEditingController titleController = TextEditingController();

  void resetFields() {
    setState(() {
      titleController.clear();
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
            "Add new shelf",
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
                      labelText: 'Shelf name',
                      hintText: 'Enter shelf name',
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
                ],
              ),
            ),
            SizedBox(
              width: ((MediaQuery.of(context).size.width) / 1.5),
              child: ElevatedButton(
                onPressed: () {
                  var newShelf = Shelf(name: titleController.text);
                  setState(() {
                    final dataManager =
                        Provider.of<DataManager>(context, listen: false);
                    dataManager.updateShelfList(newShelf, false);
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFF141D29)),
                child: Text(
                  'Add',
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
