import 'package:booky/data_manager.dart';
import 'package:booky/shelf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booky/book.dart';

class ShelvesList extends StatefulWidget {
  const ShelvesList({Key? key, required this.book}) : super(key: key);
  final Book book;
  @override
  State<ShelvesList> createState() => _ShelvesListState();
}

class _ShelvesListState extends State<ShelvesList> {
  final DataManager manager = DataManager();
  int _selectedShelfIndex = -1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Shelves",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: manager.myShelves.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile(
                  title: Text(manager.myShelves[index].name),
                  value: index,
                  groupValue: _selectedShelfIndex,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedShelfIndex = value!;
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width) / 1.5),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedShelfIndex != -1) {
                  Shelf selectedShelf = manager.myShelves[_selectedShelfIndex];
                  setState(() {
                    final dataManager =
                    Provider.of<DataManager>(context, listen: false);
                    dataManager.addBookToShelf(
                        widget.book, selectedShelf);
                    dataManager.addBookToMyBooks(
                        widget.book);
                    Navigator.pop(context);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                side: const BorderSide(color: Color(0xFF58595B)),
                backgroundColor: const Color(0xFF141D29),
              ),
              child: Text(
                'Confirm',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFDCE2EB),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
