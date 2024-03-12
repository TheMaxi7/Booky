import 'package:booky/shelf_info.dart';
import 'package:flutter/material.dart';
import 'package:booky/my_shelf_card.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';

class MyLibraryShelves extends StatefulWidget {
  const MyLibraryShelves({Key? key}) : super(key: key);

  @override
  State<MyLibraryShelves> createState() => _MyLibraryShelvesState();
}

class _MyLibraryShelvesState extends State<MyLibraryShelves> {

  final DataManager manager = DataManager();

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
        builder: (context, manager, child) {
          return ListView.separated(
            itemCount: manager.myShelves.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(color: Color(0xFFDCE2EB),);
            },
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ShelfInfo(shelf: manager.myShelves[index]),
                    ),
                  );
                },
                child: ShelfCard(shelf: manager.myShelves[index]),
              );
            },
          );
        }
    );
  }
}
