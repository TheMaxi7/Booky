
import 'package:flutter/material.dart';

class Challenge {
  String name = "";
  IconData trophy = Icons.star;
  String info = "";
  bool isCompleted= false;

  Challenge({
    this.name = "",
    this.trophy = Icons.star,
    this.info="",
    this.isCompleted = false,

  });

}