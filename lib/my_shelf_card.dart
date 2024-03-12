import 'package:booky/data_manager.dart';
import 'package:booky/shelf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShelfCard extends StatefulWidget {
  const ShelfCard({Key? key, required this.shelf}) : super(key: key);

  final Shelf shelf;

  @override
  State<ShelfCard> createState() => _ShelfCardState();
}

class _ShelfCardState extends State<ShelfCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(builder: (context, manager, child) {
      return GestureDetector(
          onLongPressStart: (value) {
            _showDeleteShelfButton(context, value.globalPosition, widget.shelf);
          },
          child: Card(
            elevation: 2,
            surfaceTintColor: widget.shelf.color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.shelf.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                if (isExpanded)
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.shelf.books.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: (MediaQuery.of(context).size.width) / 6,
                            height:
                                (MediaQuery.of(context).size.width) / 6 * 1.51,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage(widget.shelf.books[index].cover),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ));
    });
  }

  void _showDeleteShelfButton(
      BuildContext context, Offset offset, Shelf shelf) {
    final RenderObject overlay =
        Overlay.of(context).context.findRenderObject()!;

    showMenu(
        context: context,
        items: [
          PopupMenuItem(
            child: const Row(children: [
              Icon(Icons.delete),
              SizedBox(width: 16),
              Text('Delete')
            ]),
            onTap: () {
              setState(() {
                final dataManager =
                    Provider.of<DataManager>(context, listen: false);
                dataManager.updateShelfList(shelf, true);
              });
            },
          ),
        ],
        position: RelativeRect.fromRect(
            Rect.fromLTWH(offset.dx, offset.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay.paintBounds.size.width,
                overlay.paintBounds.size.height)));
  }
}
