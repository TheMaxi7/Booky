import 'package:flutter/material.dart';

import 'book.dart';

class Shelf {
  String name = "";
  String cover = "";
  Color color;
  List<Book> books = [];


  Shelf({
    this.name = "",
    this.cover="",
    this.color= const Color(0xFFDCE2EB),
    this.books = const [],
  });

}