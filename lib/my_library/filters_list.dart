import 'package:booky/data_and_classes/data_manager.dart';
import 'package:booky/my_library/filtered_book_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booky/data_and_classes/book.dart';

class FiltersList extends StatefulWidget {
  const FiltersList({super.key});

  @override
  State<FiltersList> createState() => _FiltersListState();
}

class _FiltersListState extends State<FiltersList> {
  final DataManager manager = DataManager();
  int _selectedFilterIndex = -1;
  late List<Book> filteredBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Filters",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                RadioListTile(
                  title: const Text('Completed'),
                  value: 0,
                  groupValue: _selectedFilterIndex,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedFilterIndex = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Started'),
                  value: 1,
                  groupValue: _selectedFilterIndex,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedFilterIndex = value!;
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
                if (_selectedFilterIndex == 0) {
                  setState(() {
                    final dataManager =
                        Provider.of<DataManager>(context, listen: false);
                    filteredBooks = dataManager.filterCompleted();
                  });
                } else if (_selectedFilterIndex == 1) {
                  setState(() {
                    final dataManager =
                        Provider.of<DataManager>(context, listen: false);
                    filteredBooks = dataManager.filterStarted();
                  });
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilteredBookList(
                              filteredList: filteredBooks,
                            )));
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                side: const BorderSide(color: Color(0xFF58595B)),
                backgroundColor: const Color(0xFF141D29),
              ),
              child: Text(
                'Filter',
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
