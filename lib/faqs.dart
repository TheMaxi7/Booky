import 'package:flutter/material.dart';

class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "FAQs",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const Column(
      ),
    );
  }
}
