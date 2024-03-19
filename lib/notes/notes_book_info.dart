import 'package:booky/data_and_classes/book.dart';
import 'package:booky/notes/new_note.dart';
import 'package:booky/notes/new_quote.dart';
import 'package:booky/notes/notes_book_info_notes_tab.dart';
import 'package:booky/notes/notes_book_info_quote_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesBookInfo extends StatefulWidget {
  const NotesBookInfo({super.key, required this.book});

  final Book book;

  @override
  State<NotesBookInfo> createState() => _NotesBookInfoState();
}

class _NotesBookInfoState extends State<NotesBookInfo>
    with TickerProviderStateMixin {
  late TabController _notesTabController;
  int _currentNotesIndex = 0;
  @override
  void initState() {
    super.initState();
    _notesTabController = TabController(length: 2, vsync: this);

    _notesTabController.addListener(_tabChanged);
  }

  void _tabChanged() {
    setState(() {
      _currentNotesIndex = _notesTabController.index;
    });
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
        title: Text(
          widget.book.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          if (_notesTabController.index == 0)
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewNote(book: widget.book)));
                },
                icon: const Icon(Icons.add, color: Color(0xFF58595B), size: 30),),
          if (_notesTabController.index == 1)
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewQuote(book: widget.book)));
                },
                icon: const Icon(Icons.add ,color: Color(0xFF58595B), size: 30)),
        ],
        bottom: TabBar(
          labelStyle: GoogleFonts.exoTextTheme().bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          unselectedLabelStyle: GoogleFonts.exoTextTheme().bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
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
