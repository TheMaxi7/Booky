import 'package:booky/book.dart';
import 'package:booky/notes_book_info_notes_tab.dart';
import 'package:booky/notes_book_info_quote_tab.dart';
import 'package:flutter/material.dart';

class NotesBookInfo extends StatefulWidget {
  const NotesBookInfo({super.key, required this.book});

  final Book book;

  @override
  State<NotesBookInfo> createState() => _NotesBookInfoState();
}

class _NotesBookInfoState extends State<NotesBookInfo>
    with TickerProviderStateMixin {
  late TabController _notesTabController;

  @override
  void initState() {
    super.initState();
    _notesTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _notesTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(widget.book.name,
            style: const TextStyle(color: Color(0xFF141D29))),
        bottom: TabBar(
          controller: _notesTabController,
          tabs: const [
            Tab(text: "Notes"),
            Tab(text: "Quotes"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _notesTabController,
        children: [
          NotesTab(book: widget.book),
          QuotesTab(book: widget.book),
        ],
      ),
    );
  }
}
