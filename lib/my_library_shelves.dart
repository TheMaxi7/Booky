import 'package:booky/shelf_info.dart';
import 'package:flutter/material.dart';
import 'package:booky/my_shelf_card.dart';
import 'data_manager.dart';

class MyLibraryShelves extends StatefulWidget {
  const MyLibraryShelves({Key? key}) : super(key: key);

  @override
  State<MyLibraryShelves> createState() => _MyLibraryShelvesState();
}

class _MyLibraryShelvesState extends State<MyLibraryShelves> {
  final DataManager manager = DataManager(); // Assuming you have a DataManager instance

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: manager.myShelves.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(); // You can customize the separator here
      },
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Handle the tap event here, for example, navigate to another screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShelfInfo(shelf: manager.myShelves[index]),
              ),
            );
          },
          child: ShelfCard(shelf: manager.myShelves[index]),
        );
      },
    );
  }
}
